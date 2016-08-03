#!/bin/bash -euxC

rm build/oraclelinux7 || true
packer build oraclelinux.json
vagarant box remove oraclelinux7 || true
vagrant box add oraclelinux7 build/oraclelinux 
