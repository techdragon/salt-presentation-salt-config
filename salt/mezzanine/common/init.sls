django-site-group:
  group.present:
    - name: django

django-site-user:
  user.present:
    - name: django
    - createhome: True
    - home: /home/django
    - groups:
      - users
      - django
    - require:
      - group: django-site-group
  file.directory:
    - name: /home/django/.ssh
    - makedirs: True
    - user: django
    - group: django
    - mode: 755

base-code-dir:
  file.directory:
    - name: /srv/code
    - makedirs: True

website-code-cache-dir:
  file.directory:
    - name: /srv/code/website
    - makedirs: True
    - user: django
    - group: django
    - require:
      - file: base-code-dir
      - user: django-site-user
      - group: django-site-group

website-code-dir:
  file.directory:
    - name: /home/django/virtualenvs/django/project
    - makedirs: True
    - user: django
    - group: django
    - require:
      - file: base-code-dir
      - user: django-site-user
      - group: django-site-group
