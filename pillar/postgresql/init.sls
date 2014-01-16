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


postgresql:
  users:
    sentry_db_user:
      name: sentryuser
      password: qk6Dd9LmLth7
    graphite_db_user:
      name: graphiteuser
      password: 7xm3kJJrTo46
    mezzanine_db_user:
      name: reddituser
      password: fHaZzjmyR00X

  databases:
    sentry_database:
      name: sentrydb
      owner: sentryuser
    graphite_database:
      name: graphitedb
      owner: graphiteuser

  configuration:
    max_connections: 100
    wal_level: minimal
    archive_mode: off
    incoming_wals_directory: /dev/null
    work_mem: 16MB

