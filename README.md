#SaltStack for bare metal Kubernetes

This is the repo I'll be using to track my salt-stack implementation of Kubernetes on bare metal.  If you're going to use this code, keep in mind that all of the salt config is based off of my lab layout as shown below...

![Alt text](http://www.dasblinkenlichten.com/wp-content/uploads/2015/03/image.png)

The lab has 1 server (kubbuild) that I use for building the Kubernetes binaries and also acts as the salt-master.  The remaining 5 servers (kubmasta, kubminion[1-4]) are the actual Kubernetes cluster and all act as salt-minions.  That being said, for the Salt config to work your servers have to have the same IP addresses and DNS names that I use in my lab.  

I'll be updating this as I refine my Salt config and build on the Kubernetes components.
