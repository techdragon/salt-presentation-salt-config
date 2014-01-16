fail2ban:
    pkg.installed:
        - name: fail2ban
        - require:
            - pkg: syslog-ng
    service:
        - running
        - require:
            - pkg: fail2ban
