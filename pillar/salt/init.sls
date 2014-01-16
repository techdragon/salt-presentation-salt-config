salt:
  master:
    fileserver_backend:
      # - git
      - roots
    # gitfs_remotes:
      # - git://github.com/saltstack-formulas/salt-formula.git
    file_roots:
      base:
        - /srv/salt
    pillar_roots:
      base:
        - /srv/pillar
    client_acl:
      jenkins:
        - .*
  minion:
    master: salt
