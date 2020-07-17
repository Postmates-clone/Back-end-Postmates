from .base import *

SECRETS_PRODUCTION = SECRETS_FULL['production']

DEBUG = True

WSGI_APPLICATION = 'config.wsgi.production.application'

# Static files (CSS, JavaScript)

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(ROOT_DIR, 'staticfiles')

# Media Files (Images, i.e. User Uploads)

MEDIA_ROOT = os.path.join(ROOT_DIR, '.media')
MEDIA_URL = '/media/'

# RDS

DATABASES = SECRETS_PRODUCTION['DATABASES']

ALLOWED_HOSTS += [
    '*',
]

# CORS
CORS_ORIGIN_ALLOW_ALL = True
CORS_ALLOW_CREDENTIALS = True
