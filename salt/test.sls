#Install Docker Repo
dockerrepo:
  pkgrepo.managed:
    - name: dockerrepo
    - humanname: Docker Repository
    - mirrorlist: https://yum.dockerproject.org/repo/main/centos/$releasever/
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://yum.dockerproject.org/gpg

