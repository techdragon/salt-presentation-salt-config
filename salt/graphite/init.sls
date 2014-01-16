# required packages for graphite
graphite-base-pkgs:
  pkg.installed:
    - pkgs:
      - pkg-config
      - sqlite3
      - libcairo2
      - libcairo2-dev
      - python-cairo

pips:
  pip.installed:
    - names:
      - django
      - python-memcached
      - django-tagging
      - twisted
      - zope.interface
      - uwsgi
      - whisper
      - carbon
      - graphite-web
    - require:
      - pkg: graphite-base-pkgs

configs:
  file.recurse:
    - name: /opt/graphite/conf
    - source: salt://graphite/files/conf
    - require:
      - pip: pips

carbon-conf:
  file.managed:
    - name: /opt/graphite/conf/carbon.conf
    - source: salt://graphite/files/edit/carbon.conf
    - template: jinja
    - require:
      - file: configs

localsetting-conf:
  file.managed:
    - name: /opt/graphite/webapp/graphite/local_settings.py
    - source: salt://graphite/files/edit/local_settings.py
    - template: jinja
    - require:
      - file: configs

/etc/supervisor/conf.d/graphite.conf:
  file.managed:
    - source: salt://graphite/graphite_supervisor.conf
    - template: jinja
    - require:
        - pkg: supervisor
    - watch_in:
        - cmd: supervisor_reload
        - service: supervisor

/etc/nginx/sites-enabled/graphite.conf:
  file.managed:
    - source: salt://graphite/graphite_nginx.conf
    - template:
    - user: www-data
    - group: www-data
    - mode: 440
    - watch_in:
        - service: nginx

/srv/security/nginx/graphite.htpasswd:
  file.managed:
    - source: salt://graphite/files/htpasswd
    - makedirs: True
    - template: jinja
    - watch_in:
        - service: nginx
