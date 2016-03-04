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

kube-system-ns:
  cmd.run:
    - name: kubectl create -f /etc/kubernetes/pods/system/kube-system-ns.yaml
