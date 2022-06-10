#!/bin/bash
cd ./Terraform
echo "
RDS_HOSTNAME=`terraform output -raw RDS_HOSTNAME`
RDS_PORT=`terraform output RDS_PORT`
REDIS_HOSTNAME=`terraform output -raw REDIS_HOSTNAME`
REDIS_PORT=`terraform output REDIS_PORT`
" >  ../Ansible/.env