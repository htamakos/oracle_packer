#!/bin/bash -euxC

#public_key=`cat ~/.ssh/id_rsa.pub`
rm box/oraclelinux68.box || true
packer build oraclelinux.json #-var "authorized_public_key=${public_key}"  
vagrant box remove oraclelinux68 || true
vagrant box add box/oraclelinux68.box --name oraclelinux68 || true
