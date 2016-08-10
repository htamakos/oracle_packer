#!/bin/bash -euxC

SSH_USER=${SSH_USER:-oracle}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

VERSION=$(cat ${SSH_USER_HOME}/.vbox_version)
echo "mount VBoxGuestAdditions"
mount -o loop ${SSH_USER_HOME}/VBoxGuestAdditions_${VERSION}.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11
umount /mnt
rm -rf ${SSH_USER_HOME}/VBoxGuestAdditions_${VERSION}.iso
rm -f ${SSH_USER_HOME}/.vbox_version
