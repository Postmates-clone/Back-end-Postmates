from .base import *

SECRETS_DEV = SECRETS_FULL['dev']

DEBUG = True

WSGI_APPLICATION = 'config.wsgi.dev.application'

# Static files (CSS, JavaScript)

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(ROOT_DIR, 'staticfiles')

# Media Files (Images, i.e. User Uploads)

MEDIA_ROOT = os.path.join(ROOT_DIR, '.media')
MEDIA_URL = '/media/'

DATABASES = SECRETS_DEV['DATABASES']

ALLOWED_HOSTS += [
    '*',
]

INSTALLED_APPS += [
    'django_extensions',
]
