{% set mezzanine = pillar.get('mezzanine', {}) -%}
{% set settings = mezzanine.get('settings', {}) -%}
{% set project_name = settings.get('project_name', 'django') -%}
{% set project_path = settings.get('project_path', '/home/django/virtualenvs/django/project') -%}
{% set project_user = settings.get('user', '') -%}

{{ project_path }}/local_settings.py:
  file.managed:
    - source: salt://mezzanine/production/files/production_settings.py
    - user: django
    - group: django
    - template: jinja

/etc/nginx/sites-available/{{ project_name }}.conf:
  file.managed:
    - source: salt://mezzanine/production/files/production_nginx.conf
    - template: jinja
    - user: www-data
    - group: www-data
    - mode: 440

/etc/nginx/sites-enabled/{{ project_name }}.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/{{ project_name }}.conf
    - user: www-data
    - group: www-data
    - watch_in:
      - service: nginx


/etc/supervisor/conf.d/{{ project_name }}.conf:
  file:
    - managed
    - source: salt://mezzanine/production/files/production_supervisor.conf
    - template: jinja
    - require:
        - pkg: supervisor
        - file: supervisor-config-dir
    - watch_in:
        - cmd: supervisor_reload
        # - service: supervisor


/home/django/uwsgi.ini:
  file.managed:
    - source: salt://mezzanine/common/files/uwsgi.ini
    - template: jinja
    - user: django
    - group: django

{{ project_path }}/wsgi.py:
  file.managed:
    - source: salt://mezzanine/common/files/wsgi.py
    - template: jinja

