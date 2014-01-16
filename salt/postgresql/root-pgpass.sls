root-pgpass:
    file.managed:
        - name: /root/.pgpass
        - source: salt://postgresql/files/pgpass
        - user: root
        - group: root
        - mode: 0600

# this is needed so that collectd can query from postgres
