# Jenkins Pipeline To Provision Infrasturcture On AWS Using Terraform Ansible Docker 

## Preparing Jenkins master:
* Clone The repo:
```sh
git clone git@github.com:mostafahassan097/AWS-Infrastructure.git 
```
* Build the Dockerfile of Jenkins (In DockerFiles Folder):
```sh
docker -f  JenkinswithDocker -t jenkins_master.
```
* Run a docker container:
```sh
docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v jenkinsvol1:/var/jenkins_home -p 8082:8080 jenkins_master
```
* Access the Jenkins server on http://localhost:8082

## Before You start you should install the bellow plugins :
Install Plugins:
- Cloudbees AWS credentials
- pipeline AWS Steps
- Ansible
- Terraform
![App Screenshot](https://github.com/mostafahassan097/Terraform-Project/blob/main/screenshots/11.png)
* Configure Terraform Dashboard >> Global Tool Configuration
![App Screenshot](https://github.com/mostafahassan097/Terraform-Project/blob/main/screenshots/12.png)
* Add: Global credentials:
![App Screenshot](https://github.com/mostafahassan097/Terraform-Project/blob/main/screenshots/13.png)

> Note: Create bucket  from aws consol to save your terraform state 
> Note: Create Dynamodb table named "backend". The table must have a partition key named LockID with type of String 


## Creating the Infrastructures:
* Create a new Item of type pipeline: using the repo link
```sh
https://github.com/moutazmuhammad/AWS-Terraform-Task.git
```
![Build Status](https://github.com/moutazmuhammad/AWS-Terraform-Task/blob/main/img/5.png?raw=true)
* Build the Pipeline
![Build Status](https://github.com/moutazmuhammad/AWS-Terraform-Task/blob/main/img/6.png?raw=true)

## ADD the private EC2 as a slave for Jenkins:
* Choose Launch agent via execution of a command on the master. In Lasunch command, Write the following command:
```sh
ssh -T -o ProxyCommand="ssh -W %h:%p -q bastion" -t  -i ~/.ssh/privatekey.pem ubuntu@private_ip_of_instance exec  java -jar ~/bin/agent.jar
```
![Build Status](https://github.com/moutazmuhammad/AWS-Terraform-Task/blob/main/img/7.png?raw=true)

* Save and Launch the agent.
![Build Status](https://github.com/moutazmuhammad/AWS-Terraform-Task/blob/main/img/8.png?raw=true)
![Build Status](https://github.com/moutazmuhammad/AWS-Terraform-Task/blob/main/img/9.png?raw=true)

> Note: In order to get past Jenkins security feature, you will need to approve your script. Go to Manage Jenkins -> In-process Script Approval. In that screen, you will see the script that you are trying to execute. There should be an approve button that you'll need to click to approve that script.
![Build Status](https://github.com/moutazmuhammad/AWS-Terraform-Task/blob/main/img/10.png?raw=true)


## For Nodejs App:
* Create a new Item of type pipeline: using the repo link
```sh
https://github.com/moutazmuhammad/NodeJs_CI-CD.git
```

> Note: Add the RDS endpoint and the elasticache redis endpoint in the Jenkinsfile and push it to the repo. In Jenkins add the RDS credentials and name RDS_CRED

![Build Status](https://github.com/moutazmuhammad/AWS-Terraform-Task/blob/main/img/11.png?raw=true)
* Build the Pipeline
![Build Status](https://github.com/moutazmuhammad/AWS-Terraform-Task/blob/main/img/12.png?raw=true)

## The result:
![Build Status](https://github.com/moutazmuhammad/AWS-Terraform-Task/blob/main/img/13.png?raw=true)
![Build Status](https://github.com/moutazmuhammad/AWS-Terraform-Task/blob/main/img/14.png?raw=true)
![Build Status](https://github.com/moutazmuhammad/AWS-Terraform-Task/blob/main/img/15.png?raw=true)





