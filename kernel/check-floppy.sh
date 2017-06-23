#/bin/bash

echo --------------- $1 assembling the kernel ---------------
echo -e '\nuname -r:\n'
uname -r

echo -e '\nlsmod | grep floppy:\n'
lsmod | grep floppy

echo -e '\ndmesg | grep Floppy:\n'
dmesg | grep Floppy
