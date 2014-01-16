elasticsearch-user:
    group.present:
        - name: elasticsearch
    user.present:
        - groups:
            - users
            - elasticsearch
        - require:
            - group: elasticsearch

elasticsearch:
    pkg.installed:
        - sources:
            - elasticsearch: https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.deb
        - require:
            - pkg: java-jre
    service.running:
        - name: elasticsearch
        - running: True
        - enable: True
        - require:
            - pkg: elasticsearch
        - watch:
            - file: /etc/elasticsearch/elasticsearch.yml
            - file: /etc/default/elasticsearch

/etc/default/elasticsearch:
    file.managed:
        - source: salt://elasticsearch/files/etc/default/elasticsearch.jinja
        - template: jinja
        - required:
            - pkg: elasticsearch

/etc/elasticsearch/elasticsearch.yml:
    file.managed:
        - source: salt://elasticsearch/files/etc/elasticsearch/elasticsearch.yml.jinja
        - template: jinja
        - user: elasticsearch
        - group: elasticsearch
        - mode: 664
        - required:
            - pkg: elasticsearch

/etc/elasticsearch/logging.yml:
    file.managed:
        - source: salt://elasticsearch/files/etc/elasticsearch/logging.yml.jinja
        - template: jinja
        - user: elasticsearch
        - group: elasticsearch
        - mode: 664
        - required:
            - pkg: elasticsearch


/usr/share/elasticsearch/data:
    file.directory:
        - user: elasticsearch
        - group: elasticsearch
        - mode: 755
        - makedirs: True
        - required:
            - pkg: elasticsearch

