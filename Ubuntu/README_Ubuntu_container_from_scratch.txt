[This README is unfinshed]

###############################################################################################

# Bash scripts and the order to run them:

The first script to be run on the host is cgroup-namespace.sh, it creates a control group, 
limits the CPU and RAM and creates seprate namespaces.

1) cgroup-namespace.sh

The second script to be run on the host is pivot-root-container.sh

2) pivot-root-container.sh

The third script to be run on the host is network-outside-container.sh

3) network-outside-container.sh

###############################################################################################

# Updating container

Run the following commands when first inside the container:

apt update

apt upgrade

unminimize

apt install locales dialog

locale-gen "en_US.UTF-8"

###############################################################################################

# Installing packages inside the container:

GNU/Linux Containers built from scratch have been tested using the Ubuntu base image.
Additional packages in the container were needed that the Ubuntu base image did not provide, 
such as net-tools to configure interfaces inside the container. The packages were installed 
inside the container from Ubuntu's repositary using Ubuntu's Advanced Package Tool (APT), it 
is important to run the same version of Ubuntu on the host and the container if you are going 
to use the following method to install packages inside the container.

To install the packages inside the containers file system, just comment out the --net argument 
in the cgroup-namespace.sh script temporarily so the container shares the hosts network 
namespace, edit the containers /etc/resolv.conf so it has a nameserver and then run:

apt install net-tools joe htop iputils-ping less tree file libcap-ng-utils ca-certificates




