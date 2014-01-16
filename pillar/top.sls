base:
  '*':
    - globals
    - users
    - raven
    - salt
    - graphite.production

  'postgres*':
    - postgres

  'salt-demo-prime':
    - salt.master

  'elasticsearch*':
    - elasticsearch

  'jenkins*':
    - jenkins
    - nginx

  'mezzanine*':
    - mezzanine.production

  'sentry*':
    - sentry
