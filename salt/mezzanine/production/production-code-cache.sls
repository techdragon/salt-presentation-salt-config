local-mirror-of-production-code:
    git.latest:
        - name: https://github.com/stephenmcd/mezzanine.git
        - rev: master
        - target: /srv/code/website/django
        - user: django
        # - require:
        #     - pkg: git
        #     - ssh_known_hosts: github-host-fingerprint






