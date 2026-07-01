variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "address_prefixes" {
  type = list(string)
}

variable "nsg_id" {
  description = "ID of the NSG to associate with the subnet"
  type        = string
  default     = null
}
