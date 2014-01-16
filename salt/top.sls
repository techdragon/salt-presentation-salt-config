base:
  '*':
    - git
    - hostnames
    - fail2ban
    - python
    - salt.minion
    - ssh
    - stc-tooling
    - supervisor
    - syslog-ng
    - users
    - collectd
    # - logstash

  # postgres boxes
  'postgres1':
    - postgresql

  # # elasticsearch box
  'elasticsearch1':
    - elasticsearch
    - java

  'salt-demo-prime':
    - salt.master
    - halite

  'jenkins1':
    - jenkins

  'sentry1':
    - nginx
    - postgresql
    - sentry

  'graphite1':
    - nginx
    - postgresql
    - graphite

  'mezzanine1':
    - nginx
    - postgresql
    - mezzanine

  # 'kibana1':
  #   - kibana


