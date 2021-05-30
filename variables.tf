variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  default     = ""
}

variable "subnet_name" {
  description = "The name of the subnet to use in VM scale set"
  default     = ""
}

variable "vmscaleset_name" {
  description = "Specifies the name of the virtual machine scale set resource"
  default     = ""
}

variable "vm_computer_name" {
  description = "Specifies the name of the virtual machine inside the VM scale set"
  default     = ""
}

variable "log_analytics_workspace_name" {
  description = "The name of log analytics workspace name"
  default     = null
}

variable "storage_account_name" {
  description = "The name of the hub storage account to store logs"
  default     = null
}

variable "random_password_length" {
  description = "The desired length of random password created by this module"
  default     = 24
}

variable "load_balancer_sku" {
  description = "The SKU of the Azure Load Balancer. Accepted values are Basic and Standard."
  default     = "Standard"
}

variable "enable_load_balancer" {
  description = "Controls if public load balancer should be created"
  default     = true
}

variable "load_balancer_type" {
  description = "Controls the type of load balancer should be created. Possible values are public and private"
  default     = "private"
}

variable "enable_lb_nat_pool" {
  description = "If enabled load balancer nat pool will be created for SSH if flavor is linux and for winrm if flavour is windows"
  default     = false
}

variable "nat_pool_frontend_ports" {
  description = "Optional override for default NAT ports"
  type        = list(number)
  default     = [50000, 50119]
}

variable "public_ip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are `Static` or `Dynamic`"
  default     = "Static"
}

variable "public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are `Basic` and `Standard`"
  default     = "Standard"
}

variable "os_flavor" {
  description = "Specify the flavour of the operating system image to deploy VMSS. Valid values are `windows` and `linux`"
  default     = "windows"
}

variable "load_balancer_health_probe_port" {
  description = "Port on which the Probe queries the backend endpoint. Default `80`"
  default     = 80
}

variable "load_balanced_port_list" {
  description = "List of ports to be forwarded through the load balancer to the VMs"
  type        = list(number)
  default     = []
}

variable "overprovision" {
  description = "Should Azure over-provision Virtual Machines in this Scale Set? This means that multiple Virtual Machines will be provisioned and Azure will keep the instances which become available first - which improves provisioning success rates and improves deployment time. You're not billed for these over-provisioned VM's and they don't count towards the Subscription Quota. Defaults to true."
  default     = false
}

variable "virtual_machine_size" {
  description = "The Virtual Machine SKU for the Scale Set, Default is Standard_A2_V2"
  default     = "Standard_A2_v2"
}

variable "os_disk_size_gb" {
  description = "The Size of the Internal OS Disk in GB"
  default     = 40
}

variable "instances_count" {
  description = "The number of Virtual Machines in the Scale Set."
  default     = 1
}

variable "availability_zones" {
  description = "A list of Availability Zones in which the Virtual Machines in this Scale Set should be created in"
  default     = [1, 2, 3]
}

variable "availability_zone_balance" {
  description = "Should the Virtual Machines in this Scale Set be strictly evenly distributed across Availability Zones?"
  default     = true
}

variable "single_placement_group" {
  description = "Allow to have cluster of 100 VMs only"
  default     = true
}

variable "license_type" {
  description = "Specifies the type of on-premise license which should be used for this Virtual Machine. Possible values are None, Windows_Client and Windows_Server."
  default     = "None"
}

variable "os_upgrade_mode" {
  description = "Specifies how Upgrades (e.g. changing the Image/SKU) should be performed to Virtual Machine Instances. Possible values are Automatic, Manual and Rolling. Defaults to Automatic"
  default     = "Automatic"
}

variable "enable_automatic_instance_repair" {
  description = "Should the automatic instance repair be enabled on this Virtual Machine Scale Set?"
  default     = false
}

variable "grace_period" {
  description = "Amount of time (in minutes, between 30 and 90, defaults to 30 minutes) for which automatic repairs will be delayed."
  default     = "PT30M"
}

variable "source_image_id" {
  description = "The ID of an Image which each Virtual Machine in this Scale Set should be based on"
  default     = null
}

variable "custom_image" {
  description = "Proive the custom image to this module if the default variants are not sufficient"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = null
}

variable "linux_distribution_list" {
  type = map(object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))

  default = {
    ubuntu1604 = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "16.04-LTS"
      version   = "latest"
    }

    ubuntu1804 = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }

    centos8 = {
      publisher = "OpenLogic"
      offer     = "CentOS"
      sku       = "7.5"
      version   = "latest"
    }

    coreos = {
      publisher = "CoreOS"
      offer     = "CoreOS"
      sku       = "Stable"
      version   = "latest"
    }
  }
}

variable "linux_distribution_name" {
  type        = string
  default     = "ubuntu1804"
  description = "Variable to pick an OS flavour for Linux based VMSS possible values include: centos8, ubuntu1804"
}

variable "windows_distribution_list" {
  type = map(object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))

  default = {
    windows2012r2dc = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2012-R2-Datacenter"
      version   = "latest"
    }

    windows2016dc = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }

    windows2019dc = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2019-Datacenter"
      version   = "latest"
    }

    mssql2017exp = {
      publisher = "MicrosoftSQLServer"
      offer     = "SQL2017-WS2016"
      sku       = "Express"
      version   = "latest"
    }
  }
}

variable "windows_distribution_name" {
  type        = string
  default     = "windows2019dc"
  description = "Variable to pick an OS flavour for Windows based VMSS possible values include: winserver, wincore, winsql"
}

variable "os_disk_storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values include Standard_LRS, StandardSSD_LRS and Premium_LRS."
  default     = "StandardSSD_LRS"
}

variable "additional_data_disks" {
  description = "Adding additional disks capacity to add each instance (GB)"
  type        = list(number)
  default     = []
}

variable "additional_data_disks_storage_account_type" {
  description = "The Type of Storage Account which should back this Data Disk. Possible values include Standard_LRS, StandardSSD_LRS, Premium_LRS and UltraSSD_LRS."
  default     = "Standard_LRS"
}

variable "generate_admin_ssh_key" {
  description = "Generates a secure private key and encodes it as PEM."
  default     = true
}

variable "admin_ssh_key_data" {
  description = "specify the path to the existing ssh key to authenciate linux vm"
  default     = ""
}

variable "disable_password_authentication" {
  description = "Should Password Authentication be disabled on this Virtual Machine Scale Set? Defaults to true."
  default     = true
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine."
  default     = "azureadmin"
}

variable "admin_password" {
  description = "The Password which should be used for the local-administrator on this Virtual Machine"
  default     = null
}

variable "private_ip_address_allocation" {
  description = "The allocation method for the Private IP Address used by this Load Balancer. Possible values as Dynamic and Static."
  default     = "Dynamic"
}

variable "lb_private_ip_address" {
  description = "Private IP Address to assign to the Load Balancer."
  default     = null
}

variable "enable_ip_forwarding" {
  description = "Should IP Forwarding be enabled? Defaults to false"
  default     = false
}

variable "enable_accelerated_networking" {
  description = "Should Accelerated Networking be enabled? Defaults to false."
  default     = false
}

variable "dns_servers" {
  description = "List of dns servers to use for network interface"
  default     = []
}

variable "nsg_inbound_rules" {
  description = "List of network rules to apply to network interface."
  default     = []
}

variable "assign_public_ip_to_each_vm_in_vmss" {
  description = "Create a virtual machine scale set that assigns a public IP address to each VM"
  default     = false
}

variable "enable_autoscale_for_vmss" {
  description = "Manages a AutoScale Setting which can be applied to Virtual Machine Scale Sets"
  default     = false
}

variable "minimum_instances_count" {
  description = "The minimum number of instances for this resource. Valid values are between 0 and 1000"
  default     = null
}

variable "maximum_instances_count" {
  description = "The maximum number of instances for this resource. Valid values are between 0 and 1000"
  default     = ""
}

variable "scale_out_cpu_percentage_threshold" {
  description = "Specifies the threshold % of the metric that triggers the scale out action."
  default     = "80"
}

variable "scale_in_cpu_percentage_threshold" {
  description = "Specifies the threshold of the metric that triggers the scale in action."
  default     = "20"
}

variable "scaling_action_instances_number" {
  description = "The number of instances involved in the scaling action"
  default     = "1"
}

variable "nsg_diag_logs" {
  description = "NSG Monitoring Category details for Azure Diagnostic setting"
  default     = ["NetworkSecurityGroupEvent", "NetworkSecurityGroupRuleCounter"]
}

variable "pip_diag_logs" {
  description = "Load balancer Public IP Monitoring Category details for Azure Diagnostic setting"
  default     = ["DDoSProtectionNotifications", "DDoSMitigationFlowLogs", "DDoSMitigationReports"]
}

variable "lb_diag_logs" {
  description = "Load balancer Category details for Azure Diagnostic setting"
  default     = ["LoadBalancerAlertEvent"]
}

variable "intall_iis_server_on_instances" {
  description = "Install ISS server on every Instance in the VM scale set"
  default     = false
}

variable "vm_time_zone" {
  description = "Specifies the Time Zone which should be used by the Virtual Machine"
  default     = null
}

variable "deploy_log_analytics_agent" {
  description = "Install log analytics agent to windows or linux VM scaleset instances"
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
