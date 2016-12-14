#!bin/bash -euxC

SSH_USER=${SSH_USER:-vagrant}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

echo "create ${SSH_USER_HOME}/.ssh dir"
mkdir -pm 700 ${SSH_USER_HOME}/.ssh

VAGRANT_SSH_KEY=`curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub`
echo $VAGRANT_SSH_KEY
echo "${VAGRANT_SSH_KEY}" >> ${SSH_USER_HOME}/.ssh/authorized_keys

chmod 0600 ${SSH_USER_HOME}/.ssh/authorized_keys
chown -R ${SSH_USER}:${SSH_USER} ${SSH_USER_HOME}/.ssh
