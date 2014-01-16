/srv/sentry/:
  virtualenv.managed:
    - system_site_packages: False
    - runas: sentry
    - require:
        - pkg: virtualenv
        - user: sentry
  file:
    - directory
    - user: sentry
    - group: sentry
    - recurse:
        - user
        - group
    - require:
        - user: sentry

sentry-setproctitle:
  pip:
    - installed
    - name: setproctitle
    - bin_env: /srv/sentry
    - require:
      - virtualenv: /srv/sentry/

sentry-python-openid:
  pip:
    - installed
    - name: python-openid
    - bin_env: /srv/sentry
    - require:
      - virtualenv: /srv/sentry/

sentry-oauth2:
  pip:
    - installed
    - name: oauth2
    - bin_env: /srv/sentry
    - require:
      - virtualenv: /srv/sentry/

sentry-mock:
  pip:
    - installed
    - name: mock
    - bin_env: /srv/sentry
    - require:
      - virtualenv: /srv/sentry/

sentry-six:
  pip:
    - installed
    - name: six
    - bin_env: /srv/sentry
    - require:
      - virtualenv: /srv/sentry/

sentry-kombu:
  pip:
    - installed
    - name: kombu
    - bin_env: /srv/sentry
    - require:
      - virtualenv: /srv/sentry/

sentry-billiard:
  pip:
    - installed
    - name: billiard
    - bin_env: /srv/sentry
    - require:
      - virtualenv: /srv/sentry/

sentry-pytz:
  pip:
    - installed
    - name: pytz
    - bin_env: /srv/sentry
    - require:
      - virtualenv: /srv/sentry/

sentry-psycopg2:
  pip:
    - installed
    - name: psycopg2==2.5.1
    - bin_env: /srv/sentry
    - require:
        - virtualenv: /srv/sentry/

sentry:
  pip:
    - installed
    - name: sentry
    - bin_env: /srv/sentry
    - require:
        - virtualenv: /srv/sentry/
  group:
    - present
    - name: sentry
  user:
    - present
    - home: /srv/sentry/
    - uid: 989
    - shell: /bin/bash
    - require:
      - group: sentry
  postgres_user:
    - present
    - require:
      - service: postgresql
  postgres_database:
    - present
    - owner: sentry
    - require:
        - postgres_user: sentry


/srv/sentry/sentry.conf.py:
  file:
    - managed
    - user: sentry
    - group: sentry
    - source: salt://sentry/sentry.conf.py
    - template: jinja
    - context:
        uri: http://{{ grains['fqdn'] }}/sentry
        from_email: sentry@{{ grains['fqdn'] }}
    - require:
        - file: /srv/sentry/

sentry_upgrade:
  cmd.wait:
    - name: /srv/sentry/bin/sentry --config=/srv/sentry/sentry.conf.py upgrade --noinput
    - user: sentry
    - group: sentry
    - watch:
        - pip: sentry
        - file: /srv/sentry/sentry.conf.py
    - require:
        - postgres_database: sentry

/etc/supervisor/conf.d/sentry.conf:
  file:
    - managed
    - source: salt://sentry/sentry_supervisor.conf
    - require:
        - pkg: supervisor
    - watch_in:
        - cmd: supervisor_reload
        - service: supervisor

/etc/nginx/sites-enabled/sentry.conf:
  file:
    - managed
    - source: salt://sentry/sentry_nginx.conf
    - template: jinja
    - user: www-data
    - group: www-data
    - mode: 440
    - context:
        domain: {{ grains['fqdn'] }}
    - watch_in:
        - service: nginx

/srv/security/nginx/sentry.htpasswd:
  file:
    - managed
    - source: salt://sentry/htpasswd
    - makedirs: True
    - template: jinja
    - watch_in:
        - service: nginx
