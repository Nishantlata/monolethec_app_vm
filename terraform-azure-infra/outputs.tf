output "resource_group_id" {
  value = module.resource_group.id
}

output "virtual_network_id" {
  value = module.vnet.id
}

output "subnet_id" {
  value = module.subnet.id
}

output "public_ip_id" {
  value = module.public_ip.id
}

output "vm_id" {
  value = module.vm.id
}
