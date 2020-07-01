FROM        python:3.7-slim

RUN         apt -y update && apt -y dist-upgrade && apt -y autoremove
RUN         apt-get install -y procps
RUN         apt -y install vim
RUN         apt -y install nginx

RUN         apt-get -y install binutils
RUN         apt-get -y install libproj-dev
RUN         apt-get -y install gdal-bin

COPY		./requirements.txt /tmp/
RUN			pip install -r /tmp/requirements.txt

COPY		. /srv/Back-end-Postmates
WORKDIR		/srv/Back-end-Postmates/app

RUN         rm /etc/nginx/sites-enabled/default
RUN         cp /srv/Back-end-Postmates/.config/local_dev/postmates.nginx /etc/nginx/sites-enabled/

RUN         mkdir   /var/log/gunicorn

CMD         /bin/bash
