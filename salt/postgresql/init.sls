# pillar/postgresql/init.sls
#
# postgresql:
#
#    users:
#        example_user:
#            name: some_user
#            password: example_password
#        another_user:
#            name: another_user
#            password: another_password
#
#    databases:
#        example_db1:
#            name: example_db
#            owner: example_user
#        example_db2:
#            name: another_db
#            owner: example_user
#
# Attention - 'name' is a required arg for each user and database

postgresql.conf:
    file.managed:
        - name: /etc/postgresql/9.1/main/postgresql.conf
        - source: salt://postgresql/postgresql.conf
        - user: postgres
        - group: postgres
        - mode: 644
        - require:
            - pkg: postgresql-9.1
        - template: jinja
        - watch_in:
            - service: postgresql

pg_hba.conf:
    file.managed:
        - name: /etc/postgresql/9.1/main/pg_hba.conf
        - source: salt://postgresql/pg_hba.conf
        - user: postgres
        - group: postgres
        - mode: 644
        - require:
            - pkg: postgresql-9.1


postgresql-packages:
    pkg.installed:
        - names:
            - postgresql-9.1
            - python-psycopg2
            - postgresql-server-dev-9.1


postgresql:
    service.running:
        - enable: True
        - watch:
            - file: pg_hba.conf
        - require:
            - pkg: postgresql-packages


kernel-shmmax-tuning:
    file.append:
        - name: /etc/sysctl.conf
        # - text: kernel.shmmax = 67108864
        - text: kernel.shmmax = 1073741824

# pg-superuser-password:
#     postgres_user.present:
#         - name: postgres
#         - createdb: true
#         - superuser: true
#         - replication: true
#         - encrypted: true
#         - password: M@s5XTHLy5%ptT77

{% if salt['pillar.get']('postgresql:users', {}) %}
{% for user_key, args in salt['pillar.get']('postgresql:users', {}).iteritems() %}
postgres-user-{{args.name}}:
    postgres_user.present:
        - name: {{ args.name }}
        - password: {{ args.password }}
        - runas: postgres
        - require:
            - service: postgresql
{% endfor %}
{% endif %}

{% if salt['pillar.get']('postgresql:databases', {}) %}
{% for database_key, args in salt['pillar.get']('postgresql:databases', {}).iteritems() %}
postgres-database-{{ args.name }}:
    postgres_database.present:
        - name: {{ args.name }}
        - owner: {{ args.owner }}
        - encoding: UTF8
        - lc_ctype: en_US.UTF8
        - lc_collate: en_US.UTF8
        - template: template0
        - require:
            - service: postgresql
            - postgres_user: postgres-user-{{ args.owner }}
        - runas: postgres
{% endfor %}
{% endif %}
