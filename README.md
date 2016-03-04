#SaltStack for bare metal Kubernetes on CentOS7

!!!Updated for Kubernetes 1.x - See older branches if you're looking for older versions!!!

##Updates and Changes
-The system pods (KubeDNS for instance) no longer auto deploy with salt.  I've instaed created a shell script that gets dumped to the host '/etc/kubernetes/podcreate.sh' that you can run after Kubernetes has loaded.  This prevents the initial high-state from failing since ETCD and the API server container are not yet loaded
-All Kubernetes connectivity (except on the master itself) uses SSL.  A set of generic certs are in the repo now in /ssl that should work for anyone. 

This is my attempt at installing and configuring a working Kubernetes cluster on any number of CentOS7 boxes. This repo will constantly be updating as the Kubernetes versions progresses (I'm trying to branch appropriately but no guarantees) and my SaltStack ability improves. Basically - these Salt states will let you configure an entire cluster by only updating a single Salt pillar (kube_data.sls). See my blog (www.dasblinkenlichten.com) for some posts on how earlier iterations of this worked. I'll try to get a current post out there soon that details how the current Salt config works but it's changing all the time so just try and use the examples.

##How to use

- Have a working SaltStack cluster
- Clone this code onto one of your servers (git clone https://github.com/jonlangemak/saltstackv2.git /srv/)
- Update the pillar file (/srv/pillar/kube_data.sls) to match your setup
- Copy the Kubernetes binaries into the salt director (/srv/salt/kubebinaries)
- Push the Salt Stack config to all of your servers defined in the pillar (salt '*' state.highstate)

See this for a walkthrough example (Keep the 'Updates and Changes' section in mind) -> http://www.dasblinkenlichten.com/kubernetes-with-saltstack-revisited/

Comments welcome!
