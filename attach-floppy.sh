#!/bin/bash

VAGRANT_VM_NAME=kernel
VM=$(basename $PWD)_$VAGRANT_VM_NAME
FLOPPY_IMG=$PWD/floppy.img

if [ ! -f $FLOPPY_IMG ];then
    dd if=/dev/zero of=$FLOPPY_IMG bs=512 count=2880
    mke2fs $FLOPPY_IMG
fi

virsh list --all --name | grep $VM >> /dev/null
if [ $? -eq 0 ];then
    virsh attach-disk $VM $FLOPPY_IMG fda --type floppy --config
else
    echo "A virtual machine does not exist."
    exit 1
fi
