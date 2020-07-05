#!/usr/bin/env python3
import os
import subprocess
import json
from pathlib import Path

with open('./secrets.json') as json_file:
    SECRETS_FULL = json.load(json_file)
    SECRETS_BASE = SECRETS_FULL['base']


DOCKER_IMAGE_TAG = 'johnkdo2020/postmates'
DOCKER_OPTIONS = [
    ('--rm', ''),
    ('-it', ''),
    # background로 실행하는 옵션 추가
    ('-d', ''),
    ('-p', '80:80'),
    ('--name', 'postmates'),
]
USER = 'ubuntu'
HOST = SECRETS_BASE['HOST']
TARGET = f'{USER}@{HOST}'
HOME = str(Path.home())
IDENTITY_FILE = os.path.join(HOME, '.ssh', 'postmates.pem')
SOURCE = os.path.join(HOME, 'projects', 'fastcampus', 'project_with_team', 'postmates', 'Back-end-Postmates')
SECRETS_FILE = os.path.join(SOURCE, 'secrets.json')


def run(cmd, ignore_error=False):
    process = subprocess.run(cmd, shell=True)
    if not ignore_error:
        process.check_returncode()


def ssh_run(cmd, ignore_error=False):
    run(f"ssh -o StrictHostKeyChecking=no -i {IDENTITY_FILE} {TARGET} -C {cmd}", ignore_error=ignore_error)


def local_build_push():
    print('*********************build**********************')
    run(f'pip freeze > requirements.txt')
    run(f'sudo docker build -t {DOCKER_IMAGE_TAG} .')
    run(f'sudo docker push {DOCKER_IMAGE_TAG}')
    print('build finish*************************')

def server_init():
    print('*******************server init ************************')
    ssh_run(f'sudo apt update')
    ssh_run(f'sudo DEBIAN_FRONTEND=noninteractive apt dist-upgrade -y')
    ssh_run(f'sudo apt -y install docker.io')


def server_pull_run():
    print('*******************server docker hub pull ************************')
    ssh_run(f'sudo docker stop postmates', ignore_error=True)
    ssh_run(f'sudo docker pull {DOCKER_IMAGE_TAG}')
    ssh_run('sudo docker run {options} {tag} /bin/bash'.format(
        options=' '.join([
            f'{key} {value}' for key, value in DOCKER_OPTIONS
        ]),
        tag=DOCKER_IMAGE_TAG,
    ))
    print('*******************server docker pull completed ************************')


def copy_secrets():
    run(f'scp -i {IDENTITY_FILE} {SECRETS_FILE} {TARGET}:/tmp', ignore_error=True)
    ssh_run(f'sudo docker cp /tmp/secrets.json postmates:/srv/Back-end-Postmates')
    print('*******************copy secrets************************')


def server_cmd():

    ssh_run(f'sudo docker exec postmates /usr/sbin/nginx -s stop', ignore_error=True)
    ssh_run(f'sudo docker exec postmates pip install "django<3.0"', ignore_error=True)
    print('**********************server nginx stop*********************')
    ssh_run(f'sudo docker exec postmates python manage.py collectstatic --noinput', ignore_error=True)
    print('*******************collect static************************')
    ssh_run(f'sudo docker exec postmates python manage.py makemigrations stores', ignore_error=True)
    print('*******************makemigrations members************************')
    ssh_run(f'sudo docker exec postmates python manage.py makemigrations members', ignore_error=True)
    # print('*******************makemigrations stores************************')
    ssh_run(f'sudo docker exec postmates python manage.py sqlmigrate stores 0001', ignore_error=True)
    ssh_run(f'sudo docker exec postmates python manage.py sqlmigrate members 0001', ignore_error=True)

    print('**********************migrate***************************')
    ssh_run(f'sudo docker exec postmates python manage.py migrate')
    ssh_run(f'sudo docker exec -it -d postmates '
            f'supervisord -c /srv/Back-end-Postmates/.config/local_dev/supervisord.conf -n')
    print('**********************manage***************************')


if __name__ == '__main__':
    try:
        local_build_push()
        server_init()
        server_pull_run()
        copy_secrets()
        server_cmd()
    except subprocess.CalledProcessError as e:
        print('deploy Error')
        print(' cmd:', e.cmd)
        print(' returncode:', e.returncode)
        print(' output:', e.output)
        print(' stdout:', e.stdout)
        print(' stderr:', e.stderr)
