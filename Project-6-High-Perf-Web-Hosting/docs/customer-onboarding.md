# Project 6: Customer Onboarding Procedure

## 1. Overview
This document outlines the steps to add a new customer website to the High-Performance Web Hosting cluster.

## 2. Prerequisites
- Site Name (e.g., customer3)
- Domain/Server Name (e.g., customer3.local)
- Document Root path (e.g., /var/www/customer3)

## 3. Automation Command
Run the following Ansible command from the management workstation:
```bash
ansible-playbook playbooks/add-website.yml \
  -e "site_name=customer3 server_name=customer3.local doc_root=/var/www/customer3"
```

## 4. Verification
1. Check Nginx status: `sudo systemctl status nginx`
2. Verify via Load Balancer IP: `curl -H "Host: customer3.local" http://<LB_IP>`
3. Confirm logging: Check `/var/log/nginx/access.log` on backend servers.
