# ACIT 4640 – Week 4 Lab (Provisioning with Terraform)

## SSH Key Creation
A new SSH key pair was created locally for this lab:

```bash
mkdir -p ~/.ssh/acit4640_lab3
ssh-keygen -t ed25519 -f ~/.ssh/acit4640_lab3/webuser -C "acit4640-lab3-webuser"

```

## Terraform commands used 

```bash 
terraform init
terraform fmt
terraform validate
terraform plan -out=daheist
terraform apply daheist
```


## Cloud- init setup 
 - Create web user 
 - Add SSH pub key
 - install nginx and nmap and ensure startup

Confil file located in 

```bash 
scripts/cloud-config.yaml
```

## SSH into created instance 
```bash 
ssh -i ~/.ssh/acit4640_lab3/webuser web@54.191.10.101
```


## Files used
```bash 
main.tf
scripts/cloud-config.yaml
```



