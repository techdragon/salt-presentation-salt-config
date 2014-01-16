python:
  pkg:
    - installed
    - name: python-dev


# python libraries and tools to be installed by the package manager on all systems.

pip:
  pkg:
    - installed
    - name: python-pip

virtualenv:
  pkg:
    - installed
    - name: python-virtualenv

virtualenvwrapper:
  pip.installed:
    - require:
      - pkg: python-pip

raven:
  pip.installed:
    - require:
      - pkg: python-pip

distribute:
  pkg:
    - installed
    - name: python-distribute
