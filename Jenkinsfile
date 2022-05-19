
/* Plugins and tools installed installed 
1- Pipeline AWS steps to use the with
2- cloudBees AWS credentials to save the credentials in jenkins
3- terraform tool
*/ 
pipeline {
  agent any
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
                // sh 'terraform workspace new dev'
                }
          }
        }
        stage('terraform plain'){
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
    }
     
  }