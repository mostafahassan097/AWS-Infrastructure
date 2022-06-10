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
![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/11.png)
* Configure Terraform Dashboard >> Global Tool Configuration
![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/12.png)
* Add: Global credentials:
![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/13.png)

> Note: Create bucket  from aws consol to save your terraform state 
> Note: Create Dynamodb table named "backend". The table must have a partition key named LockID with type of String 


## Creating the Infrastructures:
* Create a new Item of type pipeline: using the repo link
```sh
https://github.com/mostafahassan097/AWS-Infrastructure.git
```
![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/14.png)
* Build the Pipeline
![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/15.png)

![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/16.png)
## Configure Private Instance as a Slave in Jenkins:
* Choose Launch agent via execution of a command on the master. In Lasunch command, Write the following command:
```sh
ssh -T -o ProxyCommand="ssh -W %h:%p -q bastion" -t  -i ~/.ssh/myKey.pem ubuntu@private exec  java -jar ~/bin/agent.jar
```
![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/16.png)

* Save and Launch the agent.
![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/1.png)

![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/18.png)


## Create Deployment Pipeline:
* Create a new Item of type pipeline: using the repo link
```sh
https://github.com/mostafahassan097/NodeJS_Jenkins.git
```

![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/19.png)

## The result:

![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/9.png)

![App Screenshot](https://github.com/mostafahassan097/AWS-Infrastructure/blob/main/screenshots/10.png)




