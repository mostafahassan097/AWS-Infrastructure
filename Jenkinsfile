
/* Plugins and tools installed installed 
1- Pipeline AWS steps to use the with
2- cloudBees AWS credentials to save the credentials in jenkins
3- terraform tool
*/ 
pipeline {
  agent {label "master"}
    tools {
       terraform 'terraform-ver'
    }
  
    stages {
        stage('terraform format') {
            steps{
                withAWS(credentials: 'aws-creds', region: 'eu-west-1') {
                sh 'terraform fmt'
                }
            }
        }
        stage('terraform init'){
          steps{
             withAWS(credentials: 'aws-creds', region: 'eu-west-1') {
             
                sh 'terraform init'
                }
          }
        }
        stage('terraform plan'){
          steps{
             withAWS(credentials: 'aws-creds', region: 'eu-west-1') {
                sh 'terraform plan --var-file=prod.tfvars'
                }
          }
        }
         stage('terraform build'){
          steps{
             withAWS(credentials: 'aws-creds', region: 'eu-west-1') {
                sh 'terraform apply  --var-file=prod.tfvars --auto-approve'
                }
          }
        }

        stage('Configure SSH'){
          steps{
             withAWS(credentials: 'aws-creds', region: 'eu-west-1') {
                // sh 'terraform apply  --var-file=prod.tfvars --auto-approve'

                 sh """
                chmod 400 ~/.ssh/myKey.pem
                echo "Host private
    Port 22
    HostName `terraform output ApplicatoinInstance`
    User ubuntu
    IdentityFile ~/.ssh/myKey.pem
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    ServerAliveInterval 60
    ServerAliveCountMax 30

Host bastion
    HostName  `terraform output BastionInstance`
    User ubuntu
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    IdentityFile ~/.ssh/myKey.pem
" > ~/.ssh/config

echo ""
                """
                }
               
             }
          }

          stage ("Configure Private Instance With Ansible"){
            steps{
                  sh """
                  ansible-playbook -i Ansible/inventory.ini Ansible/slave.yaml
                  """
            }
          }
        }
    }