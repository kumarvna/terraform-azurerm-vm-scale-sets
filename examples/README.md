# Azure Virtual Machines Scale Sets

Azure virtual machine scale sets let you create and manage a group of identical, load balanced VMs. The number of VM instances can automatically increase or decrease in response to demand or a defined schedule. Scale sets provide high availability to your applications, and allow you to centrally manage, configure, and update a large number of VMs.

This module deploys Windows or Linux virtual machine scale sets with Public / Private Load Balancer support and many other features.

## Module Usage for

* [Linux Virtual Machine Scale Set](linux_vm_scale_sets/)
* [Windows Virtual Machine Scale Set](windows_vm_scale_sets/)

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.

## Outputs

|Name | Description|
|---- | -----------|
`admin_ssh_key_public`|The generated public key data in PEM format
`admin_ssh_key_private`|The generated private key data in PEM format
`windows_vm_password`|Password for the windows Virtual Machine
`load_balancer_public_ip`|The Public IP address allocated for load balancer
`load_balancer_private_ip`|The Private IP address allocated for load balancer
`load_balancer_nat_pool_id`|The resource ID of the Load Balancer NAT pool
`load_balancer_health_probe_id`|The resource ID of the Load Balancer health Probe
`load_balancer_rules_id`|The resource ID of the Load Balancer Rule
`network_security_group_id`|The resource id of Network security group
`linux_virtual_machine_scale_set_name`|The name of the Linux Virtual Machine Scale Set
`linux_virtual_machine_scale_set_id`|The resource ID of the Linux Virtual Machine Scale Set
`linux_virtual_machine_scale_set_unique_id`|The unique ID of the Linux Virtual Machine Scale Set
`windows_virtual_machine_scale_set_name`|The name of the windows Virtual Machine Scale Set
`windows_virtual_machine_scale_set_id`|The resource ID of the windows Virtual Machine Scale Set
`windows_virtual_machine_scale_set_unique_id`|The unique ID of the windows Virtual Machine Scale Set
