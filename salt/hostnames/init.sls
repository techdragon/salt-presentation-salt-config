{#
# {% if pillar['etc-hosts'] %}
# {% for name, host in pillar.get('etc-hosts', {}).items() %}
# etc_hosts_entry_{{ name }}:
#     host.present:
#         - ip: {{ host.get('ip', '') }}
#         - names:
#             - {{ name }}
# {% endfor %}
# {% endif %}

# toolbox:
#     host.present:
#         ip: {{ pillar['etc-hosts']['toolbox']['ip'] }}
# toolbox:
#     host.present:
#         ip: {{ pillar['etc-hosts']['toolbox']['ip'] }}
#}
