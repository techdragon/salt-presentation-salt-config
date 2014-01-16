supervisor:
  pkg:
    - installed
  service.running:
    - require:
      - pkg: supervisor
    # - watch:
    #   - file: /etc/supervisor/conf.d/*.conf

supervisor-config-dir:
    file.directory:
        - name: /etc/supervisor/conf.d

supervisor_reload:
  cmd:
    - wait
    - name: supervisorctl reload
