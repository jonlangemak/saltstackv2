#Install SkyDNS Pod
/root/skydns:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755

/root/skydns/skydns-svc.yaml:
  file:
    - managed
    - source: salt://pods/skydns/skydns-svc.yaml
    - template: jinja
    - user: root
    - group: root
    - mode: 755

/root/skydns/skydns-rc.yaml:
  file:
    - managed
    - source: salt://pods/skydns/skydns-rc.yaml
    - template: jinja
    - user: root
    - group: root
    - mode: 755

skydns-service:
  cmd.run:
    - name: kubectl create -f /root/skydns/skydns-svc.yaml

skydns-rc:
  cmd.run:
    - name: kubectl create -f /root/skydns/skydns-rc.yaml
