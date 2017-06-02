#!/bin/bash

centos_iso=CentOS-7-x86_64-Minimal-1611.iso
centos_url=http://mirror.yandex.ru/centos/7.3.1611/isos/x86_64/$centos_iso

vm_name=mkdev-vm-0
vm_memory=1024
vm_cpu=1
vm_disksize=8
vm_ks_filename=ks.cfg

if [ ! -f $centos_iso ]; then
  wget $centos_url
fi

sudo virt-install --name $vm_name \
                  --location $centos_iso \
                  --initrd-inject $vm_ks_filename \
                  --extra-args ks=file:/$vm_ks_filename \
                  --memory $vm_memory \
                  --vcpus $vm_cpu \
                  --disk size=$vm_disksize
