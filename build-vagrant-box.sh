#!/bin/bash

vm_image=mkdev-vm-0.qcow2
vm_image_fullpath=/var/lib/libvirt/images/$vm_image
vagrant_box_dir=vagrant-box
vagrant_box_name=mkdev-0

script_dir=$PWD

cd $vagrant_box_dir
if [ ! -f $vm_image_fullpath ]
then
    echo "The file with the virtual machine image was not found."
    exit 1
fi

echo "Copy the image to a temporary directory."
sudo cp $vm_image_fullpath box.img
sudo chown $(whoami):$(id -g) box.img

echo "Pack the box"
tar czf ${script_dir}/${vagrant_box_name}.box box.img metadata.json Vagrantfile

echo "Deleting a temporary file"
rm box.img
