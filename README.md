#SaltStack for bare metal Kubernetes

This is my first go at a templated config for a bare metal Kubernetes installation.  In theory, you should only need to meet the follow prereqs and make the following changes to use these scripts for your own build...

Prereqs<br>
 -Have salt already up and running<br>
 -Use the word 'master' and 'minion' in your server naming configuration.  If you don't you'll need to edit the salt/top.sls to make sure the right state files match the right servers

Changes you need to make<br>
-Update the pillar data file kube_data.sls with your relevant info

Comments welcome!
