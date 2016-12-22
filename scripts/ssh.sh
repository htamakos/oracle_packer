#!/bin/bash -euxC

SSH_USER=${SSH_USER:-vagrant}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

echo "create ${SSH_USER_HOME}/.ssh dir"
mkdir -pm 700 ${SSH_USER_HOME}/.ssh
touch ${SSH_USER_HOME}/.ssh/authorized_keys

SSH_KEY_URL="https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub"

PACKER_HTTP_PROXY=`echo $PACKER_HTTP_PROXY | sed -e "s/^\(http\|https\):\/\///g"`
[ PACKER_HTTP_PROXY != "" ] && P_PROXY="-x $PACKER_HTTP_PROXY" || P_PROXY="" 

eval "curl -L -o $SSH_USER_HOME/.ssh/authorized_keys $P_PROXY $SSH_KEY_URL"

cat ${SSH_USER_HOME}/.ssh/authorized_keys

chmod 0600 ${SSH_USER_HOME}/.ssh/authorized_keys
chown -R ${SSH_USER}:${SSH_USER} ${SSH_USER_HOME}/.ssh


