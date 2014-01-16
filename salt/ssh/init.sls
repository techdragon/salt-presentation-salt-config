openssh-client:
  pkg:
    - installed


openssh-server:
  pkg:
    - installed

ssh:
  service:
    - running
    - require:
      - pkg: openssh-server



