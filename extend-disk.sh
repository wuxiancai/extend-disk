#!/bin/bash
#extend disk

fdisk /dev/sdb <<EOF
n
p



t
8e
w
EOF
pvcreate /dev/sdb1
vgextend ubuntu-vg /dev/sdb1
lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
resize2fs /dev/ubuntu-vg/ubuntu-lv
lsblk
df -h
