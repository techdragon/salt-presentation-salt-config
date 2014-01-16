{% from "salt/package-map.jinja" import pkgs with context %}

salt-master:
  pkg.installed:
    - name: {{ pkgs['salt-master'] }}
  file.managed:
    - name: /etc/salt/master
    - template: jinja
    - source: salt://salt/files/master
  service.running:
    - enable: True
    - watch:
      - pkg: salt-master
      - file: salt-master

# leaving this in as it may be better to transition salt over
# to running with its own user/group
salt_group:
  group.present:
    - name: salt

/var/cache/salt:
  file.directory:
    - mode: 755

/var/cache/salt/jobs:
  file.directory:
    - mode: 755

/var/run/salt:
  file.directory:
    - mode: 755
