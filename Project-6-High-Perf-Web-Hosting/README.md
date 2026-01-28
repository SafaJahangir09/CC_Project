# High-Performance Web Hosting Cluster on AWS

## 🚀 Project Overview
This project demonstrates a scalable, high-performance web hosting infrastructure provisioned with **Terraform** and configured via **Ansible**. It features a redundant load balancer tier and a tuned PHP-FPM backend cluster designed for speed and reliability.

## 🏗️ Architecture
- **Region**: `me-central-1` (Middle East - Central)
- **Compute**: 2x Frontend Load Balancers (Nginx), 2x Backend Web Servers (Nginx + PHP-FPM)
- **Automation**: Dynamic Inventory using AWS EC2 plugin
- **Performance**: Optimized PHP-FPM process management and Nginx caching.



## 🛠️ Main Commands

### 1. Infrastructure Provisioning (Terraform)
```bash
terraform init
terraform apply -auto-approve
```
*Provisioning includes VPC, Subnets, and Security Groups.*

### 2. Configuration Management (Ansible)
```bash
# Run the full site deployment
ansible-playbook -i aws_ec2.yml playbooks/site.yml --private-key=./nayab-key.pem
```
*Configures the web stack, security hardening, and performance tuning.*

### 3. Customer Onboarding
```bash
ansible-playbook -i aws_ec2.yml playbooks/add-website.yml   -e "site_name=customer1 server_name=customer1.local doc_root=/var/www/customer1"
```
*Automates the creation of Nginx server blocks and directory structures.*

## 📊 Monitoring & Maintenance
- **Health Checks**: A custom Bash script (`check-site.sh`) runs every 5 minutes via Cron to monitor HTTP status and response times.
- **Logs**: Results are stored in `/var/log/site_checks.log` for audit and performance analysis.

## 📁 Project Structure
- `ansible/`: Playbooks, roles, and dynamic inventory configuration.
- `terraform/`: Infrastructure as Code files.
- `docs/`: Customer onboarding and technical documentation.
- `scripts/`: Monitoring and maintenance utility scripts.

---
**Developed as part of the Cloud Computing Project Series.**
