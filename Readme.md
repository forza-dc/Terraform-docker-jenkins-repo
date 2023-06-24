# Sample nodejs application with docker Conatiner


# Installation
READ.ME



Terraform code have four main modules

AWS region PARIS eu-west-3 for all the resource block 

Network Module 
In Network module i have create different resource block and associate each block ae per the requriments. like

module i have created multiple components like 
vpc(virtual private Network)
private and public subnets
private subnets are  database subnets and mainly used for the RDS service where we have restrict the public access ,
Public subnets are normaly used for the rescouce block like autoscaling and load balancing and more for the EC2 service so that each one service will be used through publicaly.  


# Ec2_module like
ec2 module resouce block we have created ec2 resource block that define  instance type ,size,other requried componenets ,attached 
security group ,public subnets.

# Scaling  module 
this module is using for the autoscaling and load balancing in the resource block,autoscaling in based on the launch configuration ,autoscaling and load balancer is consist of load balancer,target group ,listner but associated it with public subnets and registed ec2 as target group.
# RDS Modules
RDS module (relational database service ) in rds database mysql is the runtime and using private datebase subnets and also creating iam role that have permission to the ec2.

# BASIC USECASE MODULE FOR THE REF 
this is dynamic module that have all the ref from the other module so that same module will use for the dynamic new value to update. 
run the same infra.tf file that have resource path rest of the other block.

<!--
 module "vpc" {
  source = "../vpc_module"


}

<!-->

 The Basic Terraform command that are requried to run the usecase module 

terraform init

terraform validate

terraform plan 

terraform apply

for k8s deployment create two files Deployments.yml and service.yml file and 
set up single node cluster with KIND  and run the commands like
kubectl apply -f deployment.yml and 
kubectl apply -f service.yml 
use nodeport for the public access in service with server ip




```javascript

    // clone the application with git clone

    // then install the npm modules using
     
    npm install


```


# Running the application


```javascript


    node server.js


```


# Building docker image

```bash

    docker build -t <imagename:version> .