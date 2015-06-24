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

/etc/kubernetes/manifests/master-services.yaml:
  file.managed:
    - source: salt://manifests/master-services.yaml
    - user: root
    - group: root
    - mode: 755

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
    - source: http://storage.googleapis.com/kubernetes-release/release/v0.18.2/bin/linux/amd64/kubectl
    - source_hash: md5=e658537f2c033b472f5e7ac8b239c2b1
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
/usr/lib/systemd/system/kube-kubelet.service:
  file:
    - managed
    - source: salt://systemd/kube-kubelet.service
    - template: jinja
    - user: root
    - group: root
    - mode: 755

#Start Kubernetes services
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


