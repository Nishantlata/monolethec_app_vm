module "resource_group" {
  source = "./modules/resource-group"

  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

module "vnet" {
  source = "./modules/vnet"

  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = var.address_space
  tags                = local.common_tags
}

module "subnet" {
  source = "./modules/subnet"

  name                 = var.subnet_name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.vnet.name
  address_prefixes     = var.subnet_address_prefixes
  nsg_id               = var.nsg_association_enabled ? module.nsg.id : null
}

module "nsg" {
  source = "./modules/nsg"

  name                = var.nsg_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = local.common_tags
}

module "public_ip" {
  source = "./modules/public-ip"

  name                = var.public_ip_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = local.common_tags
}

module "nic" {
  source = "./modules/nic"

  name                 = var.nic_name
  location             = var.location
  resource_group_name  = module.resource_group.name
  subnet_id            = module.subnet.id
  public_ip_address_id = module.public_ip.id
  tags                 = local.common_tags
}

module "vm" {
  source = "./modules/vm"

  name                 = var.vm_name
  location             = var.location
  resource_group_name  = module.resource_group.name
  network_interface_id = module.nic.id
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  vm_size              = var.vm_size
  image_publisher      = var.image_publisher
  image_offer          = var.image_offer
  image_sku            = var.image_sku
  image_version        = var.image_version
  tags                 = local.common_tags
}
