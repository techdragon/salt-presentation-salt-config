mezzanine:
  settings:
    user: django
    project_name: django
    venv_home: /home/django/virtualenvs
    venv_path: /home/django/virtualenvs/django
    proj_dirname: project
    proj_path: /home/django/virtualenvs/django/project
    locale: en_US.UTF-8
    database_password: fHaZzjmyR00X
    database_host: postgres1



# env.user = conf.get("SSH_USER", getuser())
# env.password = conf.get("SSH_PASS", None)
# env.key_filename = conf.get("SSH_KEY_PATH", None)
# env.hosts = conf.get("HOSTS", [])

# env.proj_name = conf.get("PROJECT_NAME", os.getcwd().split(os.sep)[-1])
# env.venv_home = conf.get("VIRTUALENV_HOME", "/home/%s" % env.user)
# env.venv_path = "%s/%s" % (env.venv_home, env.proj_name)
# env.proj_dirname = "project"
# env.proj_path = "%s/%s" % (env.venv_path, env.proj_dirname)
# env.manage = "%s/bin/python %s/project/manage.py" % (env.venv_path, env.venv_path)
# env.live_host = conf.get("LIVE_HOSTNAME", env.hosts[0] if env.hosts else None)
# env.repo_url = conf.get("REPO_URL", None)
# env.reqs_path = conf.get("REQUIREMENTS_PATH", None)
# env.gunicorn_port = conf.get("GUNICORN_PORT", 8000)
# env.locale = conf.get("LOCALE", "en_US.UTF-8")
