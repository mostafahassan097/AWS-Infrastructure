
/* Plugins and tools installed installed 
1- Pipeline AWS steps to use the with
2- cloudBees AWS credentials to save the credentials in jenkins
3- terraform tool
*/ 
pipeline {
  agent {label '!private_slave'}
    tools {
       terraform 'terraform'
    }
  
    stages {
        stage('terraform init'){
          steps{
             withAWS(credentials: 'aws-creds', region: 'eu-west-1') {
             
                sh 'terraform -chdir="./Terraform" init'
                }
          }
        }
        stage('terraform plan'){
          steps{
             withAWS(credentials: 'aws-creds', region: 'eu-west-1') {
                sh 'terraform -chdir="./Terraform" plan --var-file=prod.tfvars'
                }
          }
        }
         stage('terraform build'){
          steps{
             withAWS(credentials: 'aws-creds', region: 'eu-west-1') {
                sh 'terraform   -chdir="./Terraform" apply  --var-file=prod.tfvars --auto-approve'
                }
          }
        }

        stage('Configure SSH'){
          steps{
             withAWS(credentials: 'aws-creds', region: 'eu-west-1') {

                 sh """
               
                chmod 400 ~/.ssh/myKey.pem
                chmod +x Extra/config-ssh.sh
                chmod +x Extra/gen-env-vars.sh 
                  ./Extra/ssh-config.sh
                  ./Extra/gen-env-vars.sh
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