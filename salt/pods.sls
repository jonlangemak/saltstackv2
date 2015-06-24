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

/root/skydns/token-system-dns.json:
  file:
    - managed
    - source: salt://pods/skydns/token-system-dns.json
    - user: root
    - group: root
    - mode: 755

token-dns:
  cmd.run:
    - name: kubectl create -f /root/skydns/token-system-dns.json

skydns-service:
  cmd.run:
    - name: kubectl create -f /root/skydns/skydns-svc.yaml

skydns-rc:
  cmd.run:
    - name: kubectl create -f /root/skydns/skydns-rc.yaml

#Install Heapster Pod
/root/heapster:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755

/root/heapster/grafana-svc.yaml:
  file:
    - managed
    - source: salt://pods/heapster/grafana-svc.yaml
    - user: root
    - group: root
    - mode: 755

/root/heapster/heapster-rc.yaml:
  file:
    - managed
    - source: salt://pods/heapster/heapster-rc.yaml
    - user: root
    - group: root
    - mode: 755

/root/heapster/heapster-svc.yaml:
  file:
    - managed
    - source: salt://pods/heapster/heapster-svc.yaml
    - user: root
    - group: root
    - mode: 755

/root/heapster/influxdb-grafana-rc.yaml:
  file:
    - managed
    - source: salt://pods/heapster/influxdb-grafana-rc.yaml
    - user: root
    - group: root
    - mode: 755

/root/heapster/influxdb-svc.yaml:
  file:
    - managed
    - source: salt://pods/heapster/influxdb-svc.yaml
    - user: root
    - group: root
    - mode: 755

/root/heapster/token-system-monitoring.json:
  file:
    - managed
    - source: salt://pods/heapster/token-system-monitoring.json
    - user: root
    - group: root
    - mode: 755

toekn-monitoring:
  cmd.run:
    - name: kubectl create -f /root/heapster/token-system-monitoring.json

grafana-svc:
  cmd.run:
    - name: kubectl create -f /root/heapster/grafana-svc.yaml

heapster-svc:
  cmd.run:
    - name: kubectl create -f /root/heapster/heapster-svc.yaml

influxdb-svc:
  cmd.run:
    - name: kubectl create -f /root/heapster/influxdb-svc.yaml

heapster-rc:
  cmd.run:
    - name: kubectl create -f /root/heapster/heapster-rc.yaml

influxdb-grafana-rc:
  cmd.run:
    - name: kubectl create -f /root/heapster/influxdb-grafana-rc.yaml

#Install fluentd elasticsearch Pod
/root/fluentd-es:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755

/root/fluentd-es/es-svc.yaml:
  file:
    - managed
    - source: salt://pods/fluentd-es/es-svc.yaml
    - user: root
    - group: root
    - mode: 755

/root/fluentd-es/es-rc.yaml:
  file:
    - managed
    - source: salt://pods/fluentd-es/es-rc.yaml
    - user: root
    - group: root
    - mode: 755

/root/fluentd-es/kibana-svc.yaml:
  file:
    - managed
    - source: salt://pods/fluentd-es/kibana-svc.yaml
    - user: root
    - group: root
    - mode: 755

/root/fluentd-es/kibana-rc.yaml:
  file:
    - managed
    - source: salt://pods/fluentd-es/kibana-rc.yaml
    - user: root
    - group: root
    - mode: 755

/root/fluentd-es/token-system-logging.json:
  file:
    - managed
    - source: salt://pods/fluentd-es/token-system-logging.json
    - user: root
    - group: root
    - mode: 755

token-logging:
  cmd.run:
    - name: kubectl create -f /root/fluentd-es/token-system-logging.json

es-service:
  cmd.run:
    - name: kubectl create -f /root/fluentd-es/es-svc.yaml

es-controller:
  cmd.run:
    - name: kubectl create -f /root/fluentd-es/es-rc.yaml

kibana-service:
  cmd.run:
    - name: kubectl create -f /root/fluentd-es/kibana-svc.yaml

kibana-controller:
  cmd.run:
    - name: kubectl create -f /root/fluentd-es/kibana-rc.yaml

