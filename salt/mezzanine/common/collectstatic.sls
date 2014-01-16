django-collectstatics:
    cmd.script:
        - user: django
        - name: salt://mezzanine/common/files/collectstatics.sh
        - stateful: True
