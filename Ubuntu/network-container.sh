#!/bin/bash

   #######      ###       ###     (IN DEVELOPMENT)
  #########      ###     ###
  ###             ###   ###       [Container View] Network Container shell script
  ###              ### ###        
  #########   ###   #####   ###
   #######    ###    ###    ###



    ###############################
   ##                             ##
  ###   Virtual Ethernet Device   ###
   ##                             ##
    ###############################

# Create Virtual Ethernet (VETH) device pair using the ip command
ip link add ethPair1a type veth peer name ethPair1b;

# Add the VETH device endpoint ethPair2b to the network namespace used by the container 
# and add the VETH device endpoint ethPair2a to the default network namespace used by the host 
# using the ip command.
ip link add ethPair2b netns $containerPid type veth peer name ethPair2a netns 1;

    ##############
   ##            ##
  ###   Bridge   ###
   ##            ##
    ##############

# Create a bridge on the host using the ip command
ip link add name br0 type bridge;

# Alternativly the brctl command could be used to create a bridge on the host
# brctl addbr br0;


# Enable Spanning Tree Protocol (STP) on the bridge using the ip command
ip link set br0 type bridge stp_state 1;

# Alternativly the brctl command could be used to enable Spanning Tree Protocol (STP) on the bridge
# brctl stp br0 on;


# Add the hosts secondary interface to bridge using the ip command
ip link set dev $hostInt master br0;

# Alternativly the brctl command could be used to add the hosts secondary interface to the bridge
# brctl addif br0 $hostInt;

# Add the VETH endpoint ethPair1a on the host to the bridge using the ip command
ip link set dev ethPair2a master br0;

# Alternativly the brctl command could be used to add the VETH device endpoint ethPair1a the to bridge
# brctl addif br0 ethPair1a;



