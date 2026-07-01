variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-tf-demo"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "vnet-tf-demo"
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "subnet-app"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
  default     = "nsg-tf-demo"
}

variable "nsg_association_enabled" {
  description = "Whether to associate the NSG with the subnet"
  type        = bool
  default     = true
}

variable "public_ip_name" {
  description = "Name of the public IP"
  type        = string
  default     = "pip-tf-demo"
}

variable "nic_name" {
  description = "Name of the NIC"
  type        = string
  default     = "nic-tf-demo"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "vm-tf-demo"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  sensitive   = true
  default     = "P@ssw0rd1234!"
}

variable "image_publisher" {
  description = "Image publisher"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Image offer"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  description = "Image SKU"
  type        = string
  default     = "22_04-lts-gen2"
}

variable "image_version" {
  description = "Image version"
  type        = string
  default     = "latest"
}
