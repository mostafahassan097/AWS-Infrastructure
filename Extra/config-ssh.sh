#!/bin/bash 
cd ./Terraform
 echo "
               Host private
                     Port 22
                     HostName `terraform output Application_Instance_IP`
                     User ubuntu
                     IdentityFile ~/.ssh/myKey.pem
                     StrictHostKeyChecking no
                     UserKnownHostsFile /dev/null

                  Host bastion
                     HostName  `terraform output Bastion_Instance_IP`
                     User ubuntu
                     StrictHostKeyChecking no
                     UserKnownHostsFile /dev/null
                     IdentityFile ~/.ssh/myKey.pem
                  " >  ~/.ssh/config