#Provider and Name
name="dev-env"
provider_name = "eu-central-1"
#========={VPC}===========================
vpc_cidr="172.0.0.0/16"
vpc_name="dev-vpc"
public_subnet_1_cidr="172.0.0.0/24"
public_subnet_2_cidr="172.0.2.0/24"
private_subnet_1_cidr="172.0.1.0/24"
private_subnet_2_cidr="172.0.3.0/24"
#========={AZ}===========================
az-1 = "eu-central-1a"
az-2 = "eu-central-1b"
#========={INSTANCE}===========================
instancetype = "t2.micro"
ami="ami-0d527b8c289b4af7f"
volumesize = "8"