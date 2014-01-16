# import os
import sys

# os.environ.setdefault("DJANGO_SETTINGS_MODULE", "project.settings")

sys.path.append('/home/django/virtualenvs/django/project')

# This application object is used by the development server
# as well as any WSGI server configured to use this file.

# from django.core.wsgi import get_wsgi_application
# application = get_wsgi_application()

# import django.core.handlers.wsgi
# application = django.core.handlers.wsgi.WSGIHandler()

# # mount this application at the webroot
# applications = { '/': 'application' }


import os

PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))
settings_module = "%s.settings" % PROJECT_ROOT.split(os.sep)[-1]
os.environ.setdefault("DJANGO_SETTINGS_MODULE", settings_module)

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
