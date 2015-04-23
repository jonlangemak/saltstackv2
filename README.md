#SaltStack for bare metal Kubernetes on CentOS7

This is my attempt at installing and configuring a working Kubernetes cluster on any number of CentOS7 boxes. This repo will constantly be updating as the Kubernetes versions progresses (I'm trying to branch appropriately but no guarantees) and my SaltStack ability improves. Basically - these Salt states will let you configure an entire cluster by only updating a single Salt pillar (kube_data.sls). See my blog (www.dasblinkenlichten.com) for some posts on how earlier iterations of this worked. I'll try to get a current post out there soon that details how the current Salt config works but it's changing all the time so just try and use the examples.

##How to use

- Have a working SaltStack cluster
- Clone this code onto one of your servers (git clone https://github.com/jonlangemak/saltstackv2.git /srv/)
- Update the pillar file (/srv/pillar/kube_data.sls) to match your setup
- Copy the Kubernetes binaries into the salt director (/srv/salt/kubebinaries)
- Push the Salt Stack config to all of your servers defined in the pillar (salt '*' state.highstate)
- Optionally deploy the cluster add-on pods to get SkyDNS, Heapster, and Fluentd Logging (salt '<your Kubernetes master> states.sls pods


Comments welcome!
