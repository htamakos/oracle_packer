#!bin/bash -euxC

SSH_USER=${SSH_USER:-oracle}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

echo "create ${SSH_USER_HOME}/.ssh dir"
mkdir -pm 700 ${SSH_USER_HOME}/.ssh
echo "${AUTHORIZED_PUBLICK_KEY}" >> ${SSH_USER_HOME}/.ssh/authorized_keys

chmod 0600 ${SSH_USER_HOME}/.ssh/authorized_keys
chown -R ${SSH_USER}:${SSH_USER} ${SSH_USER_HOME}/.ssh
