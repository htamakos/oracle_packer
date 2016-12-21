#!/bin/bash -euxC

BOX_NAME=${1-oraclelinux68}
SET_PROXY=${SET_PROXY-false}
rm box/${BOX_NAME}.box || true

if [ $SET_PROXY = 'true' ] ;then
  echo "set proxy: $http_proxy"
  packer build -var "outputbox_name=$BOX_NAME" -var "vm_name=$BOX_NAME" -var "PACKER_HTTP_PROXY=$http_proxy" oraclelinux.json
else
  packer build  -var "outputbox_name=$BOX_NAME" -var "vm_name=$BOX_NAME" oraclelinux.json
fi
vagrant box remove ${BOX_NAME} || true
vagrant box add box/${BOX_NAME}.box --name ${BOX_NAME} || true
