syslog-ng:
    pkg.installed:
        - name: syslog-ng
    service:
        - running
        - require:
            - pkg: syslog-ng