daemon = False
chdir = '/srv/Back-end-Postmates/app'
bind = 'unix:/run/postmates.sock'
accesslog = '/var/log/gunicorn/postmates-access.log'
errorlog = '/var/log/gunicorn/postmates-error.log'
capture_output = True