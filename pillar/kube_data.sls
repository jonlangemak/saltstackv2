kube_master:
  kubmasta: 
    ipaddress: 10.20.30.61
  portal_net: 10.100.0.0/16
  
kube_minions:
  kubminion1:
    ipaddress: 10.20.30.62
    docker0_bip: 10.10.10.1/24
  kubminion2:
    ipaddress: 10.20.30.63
    docker0_bip: 10.10.20.1/24
  kubminion3:
    ipaddress: 192.168.10.64
    docker0_bip: 10.10.30.1/24
  kubminion4:
    ipaddress: 192.168.10.65
    docker0_bip: 10.10.40.1/24

kube_pods:
  skydns:
    portalip: 10.100.0.10
    dnsname: kubdomain.local