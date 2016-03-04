#!/bin/bash

#System
kubectl create -f /etc/kubernetes/pods/system/kube-system-ns.yaml

#SkyDNS
kubectl create -f /etc/kubernetes/pods/skydns/skydns-svc.yaml
kubectl create -f /etc/kubernetes/pods/skydns/skydns-rc.yaml

#Kube Dashboard
kubectl create -f /etc/kubernetes/pods/dashboard/kubedashboard-svc.yaml
kubectl create -f /etc/kubernetes/pods/dashboard/kubedashboard-rc.yaml