# packages
python-setuptools:
  pkg:
    - installed

python-gevent:
  pkg:
    - installed

libjpeg-dev:
  pkg:
    - installed

libpq-dev:
  pkg:
    - installed

libxml2-dev:
  pkg:
    - installed

libxslt-dev:
  pkg:
    - installed

python-lxml:
  pkg:
    - installed

requirements-file:
  file.exists:
    - name: /home/django/virtualenvs/django/project/requirements/project.txt

/home/django/virtualenvs/django:
  virtualenv.managed:
    - system_site_packages: False
    - user: django
    - requirements: /home/django/virtualenvs/django/project/requirements/project.txt
    - require:
        # commented out virtualenv due to making it a system wide base package
        # - pkg: virtualenv
        # commenting out the user requirement as its failing, but already satisfied
        # - user: django
        - file: requirements-file
  file.directory:
    - user:  django
    - group: django
    - recurse:
      - user
      - group
    # - require:
    # commenting out the user requirement as its failing, but already satisfied
      # - user: django

# python packages required in the virtualenv that arent installed by the req file

django-setproctitle:
  pip:
    - installed
    - name: setproctitle
    - bin_env: /home/django/virtualenvs/django
    - require:
      - virtualenv: /home/django/virtualenvs/django

django-south:
  pip:
    - installed
    - name: south
    - bin_env: /home/django/virtualenvs/django
    - require:
      - virtualenv: /home/django/virtualenvs/django

django-psycopg2:
  pip:
    - installed
    - name: psycopg2
    - bin_env: /home/django/virtualenvs/django
    - require:
      - virtualenv: /home/django/virtualenvs/django

django-django-compressor:
  pip:
    - installed
    - name: django-compressor
    - bin_env: /home/django/virtualenvs/django
    - require:
      - virtualenv: /home/django/virtualenvs/django

django-python-memcached:
  pip:
    - installed
    - name: python-memcached
    - bin_env: /home/django/virtualenvs/django
    - require:
      - virtualenv: /home/django/virtualenvs/django

django-whoosh:
  pip:
    - installed
    - name: whoosh
    - bin_env: /home/django/virtualenvs/django
    - require:
      - virtualenv: /home/django/virtualenvs/django

django-uwsgi:
  pip:
    - installed
    - name: uwsgi
    - bin_env: /home/django/virtualenvs/django
    - require:
      - virtualenv: /home/django/virtualenvs/django

django-raven:
  pip:
    - installed
    - name: raven
    - bin_env: /home/django/virtualenvs/django
    - require:
      - virtualenv: /home/django/virtualenvs/django
