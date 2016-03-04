#Copy down shell script for pod builds
/etc/kubernetes/podcreate.sh:
  file.managed:
    - source: salt://scripts/podcreate.sh
    - user: root
    - group: root
    - mode: 755

#Create pods directory
/etc/kubernetes/pods:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755

#System related
/etc/kubernetes/pods/system:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755

/etc/kubernetes/pods/system/kube-system-ns.yaml:
  file.managed:
    - source: salt://pods/system/kube-system-ns.yaml
    - user: root
    - group: root
    - mode: 755

#SkyDNS Pod
/etc/kubernetes/pods/skydns:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755

/etc/kubernetes/pods/skydns/skydns-svc.yaml:
  file:
    - managed
    - source: salt://pods/skydns/skydns-svc.yaml
    - template: jinja
    - user: root
    - group: root
    - mode: 755

/etc/kubernetes/pods/skydns/skydns-rc.yaml:
  file:
    - managed
    - source: salt://pods/skydns/skydns-rc.yaml
    - template: jinja
    - user: root
    - group: root
    - mode: 755

#Kube Dashboard
/etc/kubernetes/pods/dashboard:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755

/etc/kubernetes/pods/dashboard/kubedashboard-rc.yaml:
  file:
    - managed
    - source: salt://pods/dashboard/kubedashboard-rc.yaml
    - user: root
    - group: root
    - mode: 755

/etc/kubernetes/pods/dashboard/kubedashboard-svc.yaml:
  file:
    - managed
    - source: salt://pods/dashboard/kubedashboard-svc.yaml
    - user: root
    - group: root
    - mode: 755