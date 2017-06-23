#!/bin/bash

USER=vagrant

KERNEL_VERSION_SHORT=3.10.0
KERNEL_VERSION=${KERNEL_VERSION_SHORT}-514.21.1.el7
KERNEL_BUILDID=sedovandrew.0.1
ARCH=$(uname -m)
RESULT_FILE=/home/$USER/before-kernel-build.txt

sudo -u $USER /bin/bash /home/$USER/check-floppy.sh Before > $RESULT_FILE

yum install -y rpmdevtools \
               bison \
               yum-utils \
               pesign \
               audit-libs-devel \
               binutils-devel \
               pciutils-devel \
               numactl-devel \
               elfutils-devel \
               ncurses-devel

sudo -u $USER rpmdev-setuptree

if [ ! -f kernel-${KERNEL_VERSION}.src.rpm ]; then
    if [ -f /vagrant/kernel-${KERNEL_VERSION}.src.rpm ]; then
        sudo -u $USER cp /vagrant/kernel-${KERNEL_VERSION}.src.rpm .
    else
        sudo -u $USER yumdownloader --source kernel
    fi
fi

yum-builddep -y kernel-${KERNEL_VERSION}.src.rpm
sudo -u $USER rpm -i kernel-${KERNEL_VERSION}.src.rpm

cd /home/${USER}/rpmbuild/SPECS
sudo -u $USER rpmbuild -bp --target=$ARCH kernel.spec

cd /home/$USER/rpmbuild/SOURCES/
# off "macintosh"
sudo -u $USER sed -i -r 's/.*CONFIG_MACINTOSH_DRIVERS.*/# CONFIG_MACINTOSH_DRIVERS is not set/' kernel-${KERNEL_VERSION_SHORT}-${ARCH}.config
sudo -u $USER sed -i -r 's/.*CONFIG_MAC_EMUMOUSEBTN.*//' kernel-${KERNEL_VERSION_SHORT}-${ARCH}.config
# "floppy" in kernel
sudo -u $USER sed -i -r 's/.*CONFIG_BLK_DEV_FD.*/CONFIG_BLK_DEV_FD=y/' kernel-${KERNEL_VERSION_SHORT}-${ARCH}.config

cd /home/$USER/rpmbuild/SPECS
sudo -u $USER sed -i -r "s/.*define buildid.*/%define buildid .$KERNEL_BUILDID/" kernel.spec
sudo -u $USER rpmbuild -bb --target=$ARCH kernel.spec

rpm -i /home/$USER/rpmbuild/RPMS/$ARCH/kernel-${KERNEL_VERSION}.$KERNEL_BUILDID.${ARCH}.rpm

grep "# CHECK FLOPPY" /home/$USER/.bash_profile > /dev/null
if [ $? -eq 1 ]; then
    sudo -u $USER cat >> /home/$USER/.bash_profile <<EOF
# CHECK FLOPPY
cat $RESULT_FILE
/bin/bash /home/$USER/check-floppy.sh After
EOF
fi

chown $USER $RESULT_FILE
echo -e "\n!.....The server restarts.....!\n"
shutdown -r now
