{% set collectd_conf = '/etc/collectd/collectd.conf' %}

collectd-package-source:
    pkgrepo.managed:
        - ppa: vbulax/collectd5

collectd-package:
    pkg.installed:
        - name: collectd
        - require:
            - pkgrepo: collectd-package-source

collectd-service:
    service.running:
        - name: collectd
        - enable: True
        - require:
            - pkg: collectd-package

{{ collectd_conf }}:
    file.managed:
        - source: salt://collectd/files/collectd.conf
        - template: jinja
        - defaults:
            graphite_host: 10.183.22.33
            graphite_port: 2003
            loglevel: info
        {% if 'databases' in grains %}
        - databases: {{ grains['databases'] }}
        {% endif %}
        {% if 'filecount' in grains.get('collectd', {}) %}
        - filecount: {{ grains['collectd']['filecount'] }}
        {% endif %}
        {% if 'loglevel' in grains.get('collectd', {}) %}
        - loglevel: {{ grains['collectd']['loglevel'] }}
        {% endif %}
        {% if 'redis' in grains.get('collectd', {}) %}
        - redis: {{ grains['collectd']['redis'] }}
        {% endif %}
        - require:
            - pkg: collectd-package
        - watch_in:
            - service: collectd-service
