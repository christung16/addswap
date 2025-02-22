#!/bin/bash

swapoff -a
dd if=/dev/zero of=/mnt/swap bs=1M count=1024
chmod 0600 /mnt/swap
mkswap /mnt/swap
swapon /mnt/swap
grep -qF swap /etc/fstab || echo "/mnt/swap       swap    swap    default 0       0" >> /etc/fstab 
sed -i 's/vm.swappiness.*/vm.swappiness = 20/' /etc/sysctl.conf
