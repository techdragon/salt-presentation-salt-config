# users:
#   auser:
#     sudouser: True
#     shell: /bin/zsh
#     groups:
#       - admin
#     ssh_auth:
#       - ssh-rsa PUBLICKEYKEYKEY

# absent_users:
#   - donald
#   - bad_guy

users:
  # commented out due to conflicts with the jenkins config.
  # jenkins:
  #   sudouser: False
  #   shell: /bin/bash
  #   groups:
  #     - users
  #   ssh_auth:
  #     - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjGBXjmBlKijKM5TvzEazhgE0tN650bPf8IRP3WGco7yemDoPe5FCT8PAkxHLKzicmel+AzYtVeaFW2sHloZlppPggagxaO3/PPYWsHj4J+FB4RANje8kjOQ5pxy1KYAeNGNsa8inyWVR1NfPXmdeijF1pEAhgZ4DQadh4tRbBQWnCzq0LmRHMjHGvVWdHOl9gsLrnwWpnSX5sbbi5/4DUF6ElABCavTilMliH/FWWoqq8VJixo65ZKuM8H1vKufJW5V0J+ua0inPCWsvXgiwA2bDL4QjvSJX0fvLtPNjWDJSUYCe99eVdiuYMLWQsQdooHO91h9T3R0zv4WQfFUGb jenkins@toolbox
  techdragon:
    sudouser: True
    shell: /bin/zsh
    groups:
      - users
      - wheel
    ssh_auth:
      - ssh-dss AAAAB3NzaC1kc3MAAACBAMWfBVlmT2McdjAtFEsejuJ97vkdzo+MVSa8YL4Oy2xd8KtV/ZUV9pvaoW8uIv6v7LljDqbEf8aDInLcDsYwUu+yIpvy56CkNEadjQKNoBW2ey0RjpqSIzJ/ziiXHL4/YlziP3bTYaYAKz9jbpIhcemowY7HqlCn4BnTqOPLQV79AAAAFQCmPY8WWZ/tVmZm9xB0amF8wN93xwAAAIEAhIFMzn8sEGPiMAYCahkZ01lHCenOJg7QyfmVeIhErzKkMI1kQ/aIQzFF5QoUamCKAJ2mDGzbg3XILa/4CiG575yFZ2RvLcU+oxshCDejUCCprRTcUba9TadH7EqCB0xeToaufidm0Lr8g5FAz4/8ovOYyHaQaw7MyCHWcK+knTsAAACAeO+D1zxZgwoMdTcofb/VdFCxlDMF3N6t7MxNkeCgA/qiZHMDPGg0wOvnZYtx6geYfCweYW+bnqZ6Mpm2vcyIfjify4CPSamZH+VMMzg2An+meDM760hLNdyUXb7aaOaBWXzLxe9wv6677QUJ4jygcSX2oHorjFBwqwLd6fMO1ww= techdragon@techdrgn.com
