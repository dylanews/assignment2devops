# Servian TechTestApp
- The Servian TechTest app is an application that has been created by servian to measure a candidates technical capability and fit with servian. The application is a simple GTD Go lang application that is backed by a postgres database.

## dependencies
Terraform
- Download terraform for linux through this website:  https://www.terraform.io/downloads.html
- follow the guide to install and move to bin folder in your linux machine ( sudo mv terraform user/local/bin )
- in terminal/shell, use 'terraform --version' to validate the installation.

Ansible
- Ansible is used for configuration in the ec2 instance that has been created through terraform.
- Through this link you'd be able to install ansible step by step through any operating system.
- For linux you can simply apply this code through terminal :
    - sudo apt install ansible
AWS CLI: 
- use the provided link to download aws cli for linux: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

Visual Studio Code:
- The IDE that is reccomended to use when deploying this application is visual studio code. Any IDE would be able to work but Visual Studio code is highly recommended.
- You can download the linux version of Visual Studio Code through this link : https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

AWS Educate:
- An AWS Educate account is used to create the required configuration for the process in deploying the application.

Github:
- A github repository is used for submission/sharing of this application. Therefore, it is highly recommended to clone this application and to share/configure through github.
## deploy instructions
- In this deployment application assignment, the 2 main languages/softwares that has been used is terraform and ansible.
Terraform : Terraform is an open-source infrastructure code software tool created by Hashicorp. It allows usedrs to define datacenter infrastructures using high-level configuration language.
Ansible: Ansible is an open-source software-provisioning, configuration management and application-deployment tool. It is used on many unix-like systems but can also configure windows and unix-like systems.

Terraform: In order for the application to be abled to be deployed or used in the ec2 instance, we have to create some datacenter configuration through terraform. As mentioned below would be the configurations that we have created.

VPCs - VPC is a virutal private cloud that is allocated in a public cloud environment that shares on-demand computing resources between organisations.
Load Balancers - Load balancers are configurations that allows the distribution of tasks over a set of resources.
Load balancer listeners - a Load balancer listener checks for connection requests between the protocol and port that has been configured.
Target groups -  a target group is used to specify the location and target route requests of registered targets.
Security groups - a security group acts as a virtual firewall for instance between incoming and outgoing traffic. It controls the inbound and outbound rules in your instance.
Subnets - a subnet is a logical subdivision of an ip network. In this project, there are 9 subnets involved. There are 3 private subnets, 3 public subnets and 3 data subnets.
Instances - A instance is virtual server. In this applcation, we are deploying an ec2 instance for the techtestapp.
Database - a db instance is an isolated database environment in the cloud. for the deployment of the techtestapp, we have used postgres for the ec2 database deployment.
s3 buckets - An s3 bucket is a public cloud storage resource. 

Set up :
1. Log into to your AWS educate clasroom account and go to a classtoom that contains credits.
2. When a new window appears, click on account details to access your CLI credentials.
3. Press the show button.
![cli credentials](https://github.com/RMIT-COSC2759-SDO/assessment2-student-s3699661/blob/master/clicredentials.PNG)
4. Create a file called creds.sh in your home folder, paste this content and fill in the contents from your credentials into it.
![creds](https://github.com/RMIT-COSC2759-SDO/assessment2-student-s3699661/blob/master/creds.PNG)
5. Lastly, go to the terminal session that is running terraform and type in S>source ~/creds.sh
6. This would allow the terminal to run the script codes to soruce your cli credentials.

Deployment instructions for the application:
Before the deployment - user have to go to terminal and apply ssh-keygen to generate private and public keys for this application. The public and private keys would be able to be found in a .ssh hidden folder in your home file.

Terraform : 
1. First, you have to open up the infra file in terminal.
2. Second, you'd have to do terraform init to allow terraform to configure with the files.
3. You'd then have to create a file called terraform.tfvars and fill in the file with your public_id = "(id_rsa.pub file)" and ami_id = "(latest amazon linux image)"
4. Once everything is done and configured, you can use the make up command to allow everything to be running.
5. The running process would take about 5 minutes and it would allow the datacenter configurations to be uploaded and running in aws.

Ansible:
1. After everything in terraform is running properly, you will have to open up the ansible file in terminal.
2. You'd then have to copy your private key (id_rsa.pem file) into the ansible folder in order for it to be able to run.
3. Next, you can run the run_ansible.sh shell script folder to ensure that everything is running.
![ansiblescreenshot](https://github.com/RMIT-COSC2759-SDO/assessment2-student-s3699661/blob/master/ansiblescreenshot.PNG)
4. The files would then be deployed/generated and uploaded into the ec2 instances allowing the website to run.
5. If you'd like to view the website, kindly take the public IP that would be displayed in the terminal and copy it into a browser.
6. If you'd like to access the ec2 instance that is running you'd be able to by using the command "ssh -i (id_rsa.pem private key) ec2-user@(public ip)"

## cleanup instructions
A make file has been created to ease the applying and destroying process of terraform for this application.
In the make file there contains 2 commands that could be used :

make up : 
terraform apply --auto-approve

make down:
terraform destroy --auto-approve

the make up function allows terraform to create the required vpc,load balancers,target groups,load listeners,security groups,subnets,instances and database for the application.
the make down function destroys all the created vpc,load balancers,target groups,load listeners,security groups,subnets,instances,s3 buckets,  and database for the application.