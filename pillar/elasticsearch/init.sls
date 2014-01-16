elasticsearch:
    heap_size: 256m
    cluster_name: demo
    network_host: elasticsearch1
    transport_tcp_port: 9300
    http_port: 9200
    discovery_zen_minimum_master_nodes: 0
    discovery_zen_ping_multicast_enabled: false
    discovery_zen_ping_unicast_hosts: 127.0.0.1
    action_write_consistency: quorum
