# Week 5 – Packer Nginx AMI

This project uses **Packer** to build a Debian-based Amazon Machine Image (AMI)
that installs and configures **Nginx** to serve a static HTML page.

## What this AMI does
- Uses Debian as the base OS
- Installs Nginx
- Configures Nginx using the provided configuration file
- Serves the provided HTML page from `/web/html`

## Packer Template
The completed Packer template is located in:
- `web-front.pkr.hcl`

## Screenshot
The screenshot below shows the HTML page being served by an EC2 instance
launched from the custom AMI.

![Nginx page served from AMI](screenshot.png)
