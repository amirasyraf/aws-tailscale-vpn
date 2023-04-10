# Overview

This project deploys an EC2 instance and automatically installs and sets up Tailscale as an exit node. This allows you to use essentially an on-demand VPN that you can create and destroy very quickly (~1-2 minutes).

# Requirements

- AWS account & credentials
- Tailscale account & auth key

## Usage

`terraform plan`
`terraform apply`