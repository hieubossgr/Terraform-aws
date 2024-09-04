# Terraform AWS Infrastructure Project

This repository contains a Terraform-based infrastructure setup for deploying a full AWS architecture, including services like Application Load Balancer (ALB), ECS with Fargate, Aurora RDS, ECR, Route 53, S3, and more. This README provides a comprehensive guide to understanding the project structure, the purpose of each Terraform module, and how to navigate the repository.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Repository Structure](#repository-structure)
3. [System Structure](#system-structure)
4. [System Workflow](#system-workflow)

## Project Overview

This Terraform project is designed to set up a scalable and secure AWS infrastructure to host a web application. The architecture includes:

- **Route 53:** Manages DNS for domain names.
- **Application Load Balancer (ALB):** Routes traffic to backend services running on ECS.
- **ECS (Elastic Container Service) with Fargate:** Manages containerized applications and cron jobs.
- **Aurora RDS:** Provides a managed aurora-mysql database.
- **VPC and Security Groups:** Defines network and security boundaries.
- **ECR (Elastic Container Registry):** Stores Docker images for ECS tasks.
- **CodeDeploy:** Automates deployment of applications to ECS.
- **S3 and S3 Gateway Endpoint:** Stores static assets and provides private connectivity.
- **IAM Roles and Policies:** Manages permissions for AWS services.

## Repository Structure

Here is the overview of the repository structure:

![Repository Structure](https://drive.usercontent.google.com/download?id=1PVoLnQP0E_jwF16ijCT4ukDPGpGq5CLT&export=view)

## System Structure
![Người dùng truy cập](https://drive.usercontent.google.com/download?id=1DErN6roSid-SM5t8NH66Y7yyyPPhX4ym&export=view)
**Người dùng truy cập**

![Developer push/merge code](https://drive.usercontent.google.com/download?id=16UxAoPNE-tGdaTKe1TqLRaf3bFiCi7Or&export=view)
**Developer push/merge code**

## System workflow
Here’s a high-level workflow of how the different components interact within the system:

1. **Domain Management with Route 53:**
   - Route 53 is used for domain name management and DNS routing. 
   - It routes user requests to the ALB for the application layer.

2. **VPC and Networking Setup:**
   - The VPC module creates a virtual network environment with both public and private subnets, allowing segregation of resources based on their access needs. Public subnets are typically used for the ALB, while private subnets are for ECS, RDS, and other backend services.
   - Security groups are defined to control inbound and outbound traffic between different services, ensuring only authorized traffic flows between components like ALB, ECS, RDS, and CronJobs.

3. **Application Load Balancer (ALB):**
   - ALB is set up in public subnets to handle incoming traffic from the internet.
   - It routes requests to the appropriate ECS services based on rules defined in the ALB listeners.
   - The ALB performs health checks to ensure traffic is only routed to healthy targets.

4. **ECS and ECR Integration:**
   - The ECS module deploys an ECS cluster in private subnets using the Fargate launch type for serverless container management.
   - The ECR module provides a private Docker image repository where container images are stored and pulled by ECS tasks.
   - The CI/CD pipeline in CodeDeploy interacts with ECR to automate deployment to ECS.

5. **Database Service with RDS Aurora:**
   - RDS Aurora is provisioned in private subnets to ensure the database is not directly accessible from the internet.
   - Only ECS tasks and the CronJob in private subnets can connect to the database.
   - The security group attached to RDS allows traffic only from the ECS cluster and the CronJob service.

6. **Scheduled Tasks using ECS (CronJob):**
   - The CronJob module uses ECS Fargate to run scheduled jobs. 
   - These jobs can interact with other components such as the RDS database or trigger processes in ECS.

7. **Continuous Deployment with CodeDeploy:**
   - CodeDeploy automates deployments to the ECS service. When new container images are pushed to ECR (e.g., after a code change)
   - CodeDeploy manages the rollout to ensure minimal downtime and automated rollbacks if necessary. 

8. **S3 and S3 Gateway Endpoint:**
   - An S3 bucket is used for storing static assets or backups, while an S3 gateway endpoint provides private connectivity to the S3 bucket from within the VPC without traversing the internet.

9. **IAM and Security Management:**
   - IAM roles and policies are created to manage permissions for different AWS services.
