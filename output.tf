output "admin_ssh_key_public" {
  description = "The generated public key data in PEM format"
  value       = var.generate_admin_ssh_key == true && var.os_flavor == "linux" ? tls_private_key.rsa[0].public_key_openssh : null
}

output "admin_ssh_key_private" {
  description = "The generated private key data in PEM format"
  sensitive   = true
  value       = var.generate_admin_ssh_key == true && var.os_flavor == "linux" ? tls_private_key.rsa[0].private_key_pem : null
}

output "windows_vm_password" {
  description = "Password for the windows VM"
  sensitive   = true
  value       = var.os_flavor == "windows" ? element(concat(random_password.passwd.*.result, [""]), 0) : null
}

output "linux_vm_password" {
  description = "Password for the Linux VM"
  sensitive   = true
  value       = var.os_flavor == "linux" && var.disable_password_authentication != true ? element(concat(random_password.passwd.*.result, [""]), 0) : null
}

output "load_balancer_public_ip" {
  description = "The Public IP address allocated for load balancer"
  value       = var.load_balancer_type == "public" ? element(concat(azurerm_public_ip.pip.*.ip_address, [""]), 0) : null
}

output "load_balancer_private_ip" {
  description = "The Private IP address allocated for load balancer"
  value       = var.load_balancer_type == "private" ? element(concat(azurerm_lb.vmsslb.*.private_ip_address, [""]), 0) : null
}

output "load_balancer_nat_pool_id" {
  description = "The resource ID of the Load Balancer NAT pool."
  value       = var.enable_lb_nat_pool ? element(concat(azurerm_lb_nat_pool.natpol.*.id, [""]), 0) : null
}

output "load_balancer_health_probe_id" {
  description = "The resource ID of the Load Balancer health Probe."
  value       = var.enable_load_balancer ? element(concat(azurerm_lb_probe.lbp.*.id, [""]), 0) : null
}

output "load_balancer_rules_id" {
  description = "The resource ID of the Load Balancer Rule"
  value       = var.enable_load_balancer ? element(concat(azurerm_lb_rule.lbrule.*.id, [""]), 0) : null
}

output "network_security_group_id" {
  description = "The resource id of Network security group"
  value       = azurerm_network_security_group.nsg.id
}

output "linux_virtual_machine_scale_set_name" {
  description = "The name of the Linux Virtual Machine Scale Set."
  value       = var.os_flavor == "linux" ? element(concat(azurerm_linux_virtual_machine_scale_set.linux_vmss.*.name, [""]), 0) : null
}

output "linux_virtual_machine_scale_set_id" {
  description = "The resource ID of the Linux Virtual Machine Scale Set."
  value       = var.os_flavor == "linux" ? element(concat(azurerm_linux_virtual_machine_scale_set.linux_vmss.*.id, [""]), 0) : null
}

output "linux_virtual_machine_scale_set_unique_id" {
  description = "The unique ID of the Linux Virtual Machine Scale Set."
  value       = var.os_flavor == "linux" ? element(concat(azurerm_linux_virtual_machine_scale_set.linux_vmss.*.unique_id, [""]), 0) : null
}

output "windows_virtual_machine_scale_set_name" {
  description = "The name of the windows Virtual Machine Scale Set."
  value       = var.os_flavor == "windows" ? element(concat(azurerm_windows_virtual_machine_scale_set.winsrv_vmss.*.name, [""]), 0) : null
}

output "windows_virtual_machine_scale_set_id" {
  description = "The resource ID of the windows Virtual Machine Scale Set."
  value       = var.os_flavor == "windows" ? element(concat(azurerm_windows_virtual_machine_scale_set.winsrv_vmss.*.id, [""]), 0) : null
}

output "windows_virtual_machine_scale_set_unique_id" {
  description = "The unique ID of the windows Virtual Machine Scale Set."
  value       = var.os_flavor == "windows" ? element(concat(azurerm_windows_virtual_machine_scale_set.winsrv_vmss.*.unique_id, [""]), 0) : null
}
