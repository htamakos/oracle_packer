#!bin/bash -euxC

SSH_USER=${SSH_USER:-oracle}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

echo "create ${SSH_USER_HOME}/.ssh dir"
mkdir -pm 700 ${SSH_USER_HOME}/.ssh
wget --no-check-certificate -O authorized_keys 'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub'
mv authorized_keys ${SSH_USER_HOME}/.ssh

chmod 0600 ${SSH_USER_HOME}/.ssh/authorized_keys
chown -R ${SSH_USER}:${SSH_USER} ${SSH_USER_HOME}/.ssh
