module "vmscaleset" {
  source  = "kumarvna/vm-scale-sets/azurerm"
  version = "2.1.0"

  # Resource Group and location, VNet and Subnet detials (Required)
  resource_group_name  = "rg-shared-westeurope-01"
  virtual_network_name = "vnet-shared-hub-westeurope-001"
  subnet_name          = "snet-appgateway"
  vmscaleset_name      = "testvmss"
  vm_computer_name     = "websrv1"

  # (Optional) To enable Azure Monitoring and install log analytics agents
  log_analytics_workspace_name = var.log_analytics_workspace_name
  hub_storage_account_name     = var.hub_storage_account_name

  # Deploy log analytics agents to virtual machine. Log analytics workspace name required.
  # Defaults to `false` 
  deploy_log_analytics_agent = false

  # This module support multiple Pre-Defined Linux and Windows Distributions.
  # These distributions support the Automatic OS image upgrades in virtual machine scale sets
  # Linux images: ubuntu1804, ubuntu1604, centos75, coreos
  # Windows Images: windows2012r2dc, windows2016dc, windows2019dc, windows2016dccore
  # Specify the RSA key for production workloads and set generate_admin_ssh_key argument to false
  # When you use Autoscaling feature, instances_count will become default and minimum instance count. 
  os_flavor                 = "windows"
  windows_distribution_name = "windows2019dc"
  instances_count           = 2
  admin_username            = "azureadmin"
  admin_password            = "P@$$w0rd1234!"

  # Public and private load balancer support for VM scale sets
  # Specify health probe port to allow LB to detect the backend endpoint status
  # Standard Load Balancer helps load-balance TCP and UDP flows on all ports simultaneously
  # Specify the list of ports based on your requirement for Load balanced ports
  # for additional data disks, provide the list for required size for the disk. 
  load_balancer_type              = "public"
  load_balancer_health_probe_port = 80
  load_balanced_port_list         = [80, 443]
  additional_data_disks           = [100, 200]

  # Enable Auto scaling feature for VM scaleset by set argument to true. 
  # Instances_count in VMSS will become default and minimum instance count.
  # Automatically scale out the number of VM instances based on CPU Average only.    
  enable_autoscale_for_vmss          = true
  minimum_instances_count            = 2
  maximum_instances_count            = 5
  scale_out_cpu_percentage_threshold = 80
  scale_in_cpu_percentage_threshold  = 20

  # Deploy IIS server minimal installation on VMMS instances
  intall_iis_server_on_instances = false

  # Network Seurity group port allow definitions for each Virtual Machine
  # NSG association to be added automatically for all network interfaces.
  # SSH port 22 and 3389 is exposed to the Internet recommended for only testing. 
  # For production environments, we recommend using a VPN or private connection
  nsg_inbound_rules = [
    {
      name                   = "http"
      destination_port_range = "80"
      source_address_prefix  = "*"
    },

    {
      name                   = "https"
      destination_port_range = "443"
      source_address_prefix  = "*"
    },
  ]

  # Adding TAG's to your Azure resources (Required)
  # ProjectName and Env are already declared above, to use them here, create a varible. 
  tags = {
    ProjectName  = "demo-internal"
    Env          = "dev"
    Owner        = "user@example.com"
    BusinessUnit = "CORP"
    ServiceClass = "Gold"
  }
}
