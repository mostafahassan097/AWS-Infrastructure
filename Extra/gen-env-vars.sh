#!/bin/bash
echo "
HOST=`terraform output RDS_HOSTNAME`
PORT=`terraform output RDS_PORT`
REDIS_HOST=`terraform output REDIS_HOSTNAME`
REDIS_PORT=`terraform output REDIS_PORT`
" >  Ansible/.env