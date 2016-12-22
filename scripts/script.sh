#!/bin/bash -eux

mkdir /var/log/script
chmod -R a+w /var/log/script/

tee -a /etc/profile <<-"EOF"
# output command log
P_PROC=`ps aux | grep $PPID | grep sshd | awk '{ print $11 }'`

if [ "$P_PROC" = sshd: ]; then
  script -q /var/log/script/`date '+%Y_%m_%d_%H_%M_%S'`.log
fi
EOF
