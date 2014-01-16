memcached:
    pkg:
        - installed
    service:
        - running

memcached-config:
    file.managed:
        - name: /etc/memcached.conf
        - source: salt://memcached/files/memcached.conf
        - template: jinja
        - defaults:
            listen_ip_address: 127.0.0.1
        - watch_in:
            - service: memcached
