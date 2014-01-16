{% set mezzanine = pillar.get('mezzanine', {}) %}
{% set settings = mezzanine.get('settings', {}) %}
{% set project_name = settings.get('project_name', '') %}
{% set database_password = settings.get('database_password', '') %}
{% set database_host = settings.get('database_host') %}
{% set database_port = settings.get('database_port') %}

import os
PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))

DATABASES = {
    "default": {
        # Ends with "postgresql_psycopg2", "mysql", "sqlite3" or "oracle".
        "ENGINE": "django.db.backends.postgresql_psycopg2",
        # DB name or path to database file if using sqlite3.
        "NAME": "{{ project_name }}",
        # Not used with sqlite3.
        "USER": "{{ project_name }}",
        # Not used with sqlite3.
        "PASSWORD": "{{ database_password }}",
        # Set to empty string for localhost. Not used with sqlite3.
        "HOST": "{{ database_host }}",
        # Set to empty string for default. Not used with sqlite3.
        "PORT": "{{ database_port }}",
    }
}

SECURE_PROXY_SSL_HEADER = ("HTTP_X_FORWARDED_PROTOCOL", "https")

CACHE_MIDDLEWARE_SECONDS = 60

CACHE_MIDDLEWARE_KEY_PREFIX = "{{ project_name }}"

CACHES = {
    'default': {
       'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
    },
}
SESSION_ENGINE = "django.contrib.sessions.backends.db"
CELERYD_CONCURRENCY = 3


ALLOWED_HOSTS = [
    "mezzanine1.aws.demo.techdrgn.net",
]


REQUIRE_DEBUG = False

# RAVEN_CONFIG = {
#     'dsn': '',
# }
