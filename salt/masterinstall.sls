#Pull down docker config file 
#Setup and copy down the manifests
/etc/kubernetes:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755

/etc/kubernetes/manifests:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755

/etc/kubernetes/manifests/etcd.yaml:
  file.managed:
    - source: salt://manifests/etcd.yaml
    - user: root
    - group: root
    - mode: 755

#Make the kubernetes binary directory
/opt/kubernetes:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755

#Pull down Kubernetes Binaries
/opt/kubernetes/kubectl:
  file:
    - managed
    - source: salt://kubebinaries/kubectl
    - user: root
    - group: root
    - mode: 755

/opt/kubernetes/kube-apiserver:
  file:
    - managed
    - source: salt://kubebinaries/kube-apiserver
    - user: root
    - group: root
    - mode: 755

/opt/kubernetes/kube-controller-manager:
  file:
    - managed
    - source: salt://kubebinaries/kube-controller-manager
    - user: root
    - group: root
    - mode: 755

/opt/kubernetes/kube-scheduler:
  file:
    - managed
    - source: salt://kubebinaries/kube-scheduler
    - template: jinja
    - user: root
    - group: root
    - mode: 755

/opt/kubernetes/kubelet:
  file:
    - managed
    - source: salt://kubebinaries/kubelet
    - user: root
    - group: root
    - mode: 755

#Pull down Systemd Service definitions
/usr/lib/systemd/system/kube-apiserver.service:
  file:
    - managed
    - source: salt://systemd/kube-apiserver.service
    - template: jinja
    - user: root
    - group: root
    - mode: 755

/usr/lib/systemd/system/kube-controller.service:
  file:
    - managed
    - source: salt://systemd/kube-controller.service
    - template: jinja
    - user: root
    - group: root
    - mode: 755

/usr/lib/systemd/system/kube-scheduler.service:
  file:
    - managed
    - source: salt://systemd/kube-scheduler.service
    - user: root
    - group: root
    - mode: 755

/usr/lib/systemd/system/kube-kubelet.service:
  file:
    - managed
    - source: salt://systemd/kube-kubelet.service
    - template: jinja
    - user: root
    - group: root
    - mode: 755

#Start Kubernetes services
kube-apiserver:
  service:
    - running
    - enable: true
    - watch:
      - file: /usr/lib/systemd/system/kube-apiserver.service

kube-controller:
  service:
    - running
    - enable: true

kube-scheduler:
  service:
    - running
    - enable: true

kube-kubelet:
  service:
    - running
    - enable: true
    - watch:
      - file: /etc/kubernetes/manifests/*


#Make symlink for kubectl
/usr/local/bin/kubectl:
  file.symlink:
    - target: /opt/kubernetes/kubectl
