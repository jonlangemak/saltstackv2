#Refresh Grains
updategrains:
  module.run:
    - name: saltutil.refresh_modules

#Install group packages
policycoreutils:
  pkg.installed
policycoreutils-python:
  pkg.installed
bridge-utils:
  pkg.installed
net-tools:
  pkg.installed

{% if grains.ip_interfaces.docker0 is defined and salt['pillar.get']('kube_nodes:' ~ grains['host'] ~ ':docker0_bip') in salt['grains.get']('ip_interfaces:docker0') %}
#Do nothing

{% elif grains.ip_interfaces.docker0 is not defined %}
#Do nothing

{% else %}
#Delete the Docker bridge
disable-docker0:
  cmd.run:
    - name: ifconfig docker0 down
delete-docker0:
  cmd.run:
    - name: brctl delbr docker0
{% endif %}

#Pull down docker config file
/etc/sysconfig/docker:
  file.managed:
    - source: salt://configfiles/docker
    - template: jinja
    - user: root
    - group: root
    - mode: 755

#Install docker, enable it, and run it
docker:
  pkg:
    - installed
  service:
    - running
    - watch:
      - file: /etc/sysconfig/docker
    - enable: true

selinux-config:
  file.sed:
    - name: /etc/selinux/config
    - before: (permissive|enforcing)$
    - after: disabled
    - limit: ^SELINUX=

disable-selinux:
  cmd.run:
    - name: /usr/sbin/setenforce 0

device-mapper:
  pkg.latest

firewalld:
  service:
    - dead
    - enable: false

