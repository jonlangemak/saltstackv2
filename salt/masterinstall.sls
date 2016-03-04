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

/etc/kubernetes/manifests/apiserver.yaml:
  file.managed:
    - source: salt://manifests/apiserver.yaml
    - user: root
    - template: jinja
    - group: root
    - mode: 755

/etc/kubernetes/manifests/controller.yaml:
  file.managed:
    - source: salt://manifests/controller.yaml
    - user: root
    - group: root
    - mode: 755

/etc/kubernetes/manifests/scheduler.yaml:
  file.managed:
    - source: salt://manifests/scheduler.yaml
    - user: root
    - group: root
    - mode: 755

#Setup the SSL directory
/etc/kubernetes/ssl:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755

/etc/kubernetes/ssl/server.cert:
  file.managed:
    - source: salt://ssl/server.cert
    - user: root
    - group: root
    - mode: 755

/etc/kubernetes/ssl/server.key:
  file.managed:
    - source: salt://ssl/server.key
    - user: root
    - group: root
    - mode: 755

/etc/kubernetes/ssl/ca.crt:
  file.managed:
    - source: salt://ssl/ca.crt
    - user: root
    - group: root
    - mode: 755

touch /var/log/etcd.log:
  cmd.run:
    - creates: /var/log/etcd.log



/var/etcd:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 700
    - recurse:
      - user
      - group
      - mode

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

#Make symlink for kubectl
/usr/local/bin/kubectl:
  file.symlink:
    - target: /opt/kubernetes/kubectl

#Copy down example application (guestbook)
/etc/kubernetes/examples:
  file.recurse:
    - source: salt://manifests/examples
    - user: root
    - group: root
    - template: jinja
    - dir_mode: 2775
    - file_mode: 775


