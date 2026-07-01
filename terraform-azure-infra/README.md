# Terraform Azure Infrastructure

A modular Terraform project for deploying a basic Azure infrastructure stack.

## Project Overview

This configuration creates the following resources:

- Resource Group
- Virtual Network
- Subnet
- Network Security Group (NSG)
- Public IP Address
- Network Interface Card (NIC)
- Linux Virtual Machine

The architecture is built using reusable Terraform modules under `modules/`.

## Repository Structure

```text
terraform-azure-infra/
├── backend.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars
├── versions.tf
├── variables.tf
├── locals.tf
├── backend.tf
├── environments/
│   └── dev/
│       └── terraform.tfvars
└── modules/
    ├── resource-group/
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── vnet/
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── subnet/
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── nsg/
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── public-ip/
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── nic/
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    └── vm/
        ├── main.tf
        ├── outputs.tf
        └── variables.tf
```

## Azure Backend

This project uses an Azure Storage account backend for Terraform state:

- Resource Group: `backendrg1`
- Storage Account: `backendstg10`
- Container: `backendcnt10`
- State file key: `terraform.tfstate`

## Prerequisites

- Terraform installed (compatible with `~> 1.0`)
- Azure CLI installed and authenticated
- Access to the target Azure subscription

## Deployment

Use the development environment variables file when planning and applying:

```bash
cd terraform-azure-infra
terraform init
terraform plan -var-file="environments/dev/terraform.tfvars" -out="dev.tfplan"
terraform apply -auto-approve "dev.tfplan"
```

## Destroying Resources

To remove the deployed infrastructure:

```bash
terraform destroy -var-file="environments/dev/terraform.tfvars" -auto-approve
```

## Customization

Update the following files as needed:

- `environments/dev/terraform.tfvars` for environment-specific values
- `terraform.tfvars` for shared default values
- module inputs in `main.tf` for resource wiring

## Notes

- Do not commit secrets or sensitive values to source control.
- For production, use secure secret management instead of plaintext passwords.
- If a VM SKU is unavailable in the selected Azure region, change `vm_size` in `environments/dev/terraform.tfvars`.
