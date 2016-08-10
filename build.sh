#!/bin/bash -euxC

public_key=`cat ~/.ssh/id_rsa.pub`
rm box/oraclelinux7 || true
packer build -var "authorized_public_key=${public_key}" oraclelinux.json 
vagrant box remove oraclelinux7 || true
vagrant box add box/oraclelinux7.box --name oraclelinux7 || true
