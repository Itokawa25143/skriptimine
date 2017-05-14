#!/bin/bash
# Andmed masina kohta
#set -x
clear

# Machine name
printf "Machine name:		" && hostname

# Full hostname
# "Full hostname:		" && $(hostname).$(domainname)

# IP address
printf "IP address:		" && ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk {'print $1'}

# MAC address
printf "MAC address:		" && cat /sys/class/net/eth0/address

# OS architecture
printf "OS architecture:        " && dpkg --print-architecture

# Kernel version
printf "Kernel version:		" && uname -v

# CPU name
printf "CPU name:		" && cat /proc/cpuinfo | grep 'model name' | awk '{print $4, $5,$6,$7,$8}'

# CPU cores
printf "CPU cores:		" && cat /proc/cpuinfo | grep cores | awk '{print $4}'

# Memory
printf "Memory:			" && free -m -h | awk '{print $2}' | awk 'FNR>=2 && FNR<=2'

# Hard disk space
printf "Hard disk space:	" && df -hT /home | awk '{print $3}' | awk 'FNR>=2 && FNR <=2'

# Linux distro valjastamine
printf "Distro:			" && lsb_release -d | awk '{print $2,$3,$4,$5}'

# exit
