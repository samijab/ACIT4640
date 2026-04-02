# ACIT 4640 — Lab 10: Ansible Roles

## Overview

This lab uses **Terraform** to provision two EC2 instances on AWS and **Ansible** to configure them using roles.

Two servers are created:

* **Frontend Server** (Debian) – runs nginx and serves a simple HTML page
* **Redis Server** (Rocky Linux) – installs and runs Redis

The original playbook configuration was refactored into separate **Ansible roles** for each server.

---

## SSH Key Setup

Create the SSH key used by Terraform and Ansible:

```bash
ssh-keygen -t ed25519 -f ~/.ssh/aws
```

Import the key to AWS using the provided script:

```bash
./scripts/import_lab_key ~/.ssh/aws.pub
```

---

## Terraform Setup

Move into the terraform directory:

```bash
cd terraform
```

Initialize Terraform:

```bash
terraform init
```

Preview infrastructure changes:

```bash
terraform plan
```

Create the EC2 instances:

```bash
terraform apply
```

Terraform creates two servers and outputs their public IP addresses.

---

## Ansible Configuration

Move into the ansible directory:

```bash
cd ansible
```

Check the dynamic inventory:

```bash
ansible-inventory --graph
```

Run the Ansible playbook:

```bash
ansible-playbook playbook.yml
```

The playbook performs the following tasks:

### Frontend Role

* Installs nginx
* Creates an HTML page using a template
* Copies the nginx configuration file
* Enables the nginx configuration
* Starts and enables the nginx service

### Redis Role

* Installs Redis on the Rocky Linux server
* Starts and enables the Redis service

Handlers are used to reload nginx when configuration changes occur.

---

## Result

After running the playbook, the frontend server hosts a web page through nginx.

Example access:

```
http://<frontend_public_ip>
```

---

## Screenshot

The image below shows the frontend server successfully serving the HTML page.

![Frontend Server](server-image.jpg)

---

## Project Structure

```
ansible/
├── ansible.cfg
├── playbook.yml
├── inventory/
│   └── aws_ec2.yml
└── roles/
    ├── frontend/
    │   ├── tasks/
    │   │   └── main.yml
    │   ├── handlers/
    │   │   └── main.yml
    │   ├── templates/
    │   │   └── index.html.j2
    │   └── files/
    │       └── default.conf
    └── redis/
        └── tasks/
            └── main.yml
```
