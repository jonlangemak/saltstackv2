#Refresh Grains
updategrains:
  module.run:
    - name: saltutil.refresh_modules

#Install Docker Repo
dockerrepo:
  pkgrepo.managed:
    - name: dockerrepo
    - humanname: Docker Repository
    - baseurl: https://yum.dockerproject.org/repo/main/centos/$releasever/
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://yum.dockerproject.org/gpg 

#Install group packages
policycoreutils:
  pkg.installed
policycoreutils-python:
  pkg.installed
bridge-utils:
  pkg.installed
net-tools:
  pkg.installed
wget:
  pkg.installed

#{% if grains.ip_interfaces.docker0 is defined and salt['pillar.get']('kube_nodes:' ~ grains['host'] ~ ':docker0_bip') in salt['grains.get']('ip_interfaces:docker0') %}
#Do nothing

#{% elif grains.ip_interfaces.docker0 is not defined %}
#Do nothing

#{% else %}
#Delete the Docker bridge
#disable-docker0:
#  cmd.run:
#    - name: ifconfig docker0 down
#delete-docker0:
#  cmd.run:
#    - name: brctl delbr docker0
#{% endif %}

#Pull down docker config file
/etc/sysconfig/docker:
  file.managed:
    - source: salt://configfiles/docker
    - template: jinja
    - user: root
    - group: root
    - mode: 755

#Enable docker and start the service
docker-engine:
  pkg:
    - installed
  service:
    - name: docker
    - running
    - watch:
      - file: /etc/sysconfig/docker
      - file: /usr/lib/systemd/system/docker.service
    - enable: true

#Pull down Systemd Service definition for Docker
/usr/lib/systemd/system/docker.service:
  file:
    - managed
    - source: salt://systemd/docker.service
    - user: root
    - group: root
    - mode: 755

dockerrestart:
  cmd:
    - run
    - name: systemctl restart docker

permissive:
  selinux.mode

device-mapper:
  pkg.latest

firewalld:
  service:
    - dead
    - enable: false

