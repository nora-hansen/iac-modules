module "KeyVaultModule" {
  source      = "./KeyVaultModule"
  base-name   = var.base-name
  location    = var.location
  env         = terraform.workspace
  common_tags = local.common_tags
  # Secrets
  sa-access-key = module.StorageAccountModule.sa_access_key_output
  vm-username   = var.vm-username
  vm-password   = var.vm-password
}

module "NetworkModule" {
  source      = "./NetworkModule"
  vm-pip      = module.VirtualMachineModule.vm_public_ip_output
  base-name   = var.base-name
  location    = var.location
  env         = terraform.workspace
  common_tags = local.common_tags
  # Virtual Network
  vnet-name   = var.vnet-name
  addr-space  = var.addr-space
  dns-servers = var.dns-servers
  # Subnet
  subnet-name = var.subnet-name
  addr-pref   = var.addr-pref
  # Network Security Group
  nsg-name           = var.nsg-name
  security-rule-name = var.security-rule-name
  security-priority  = var.security-priority
  security-direction = var.security-direction
  security-access    = var.security-access
  security-protocol  = var.security-protocol
}

# Change
module "StorageAccountModule" {
  source      = "./StorageAccountModule"
  base-name   = var.base-name
  location    = var.location
  env         = terraform.workspace
  common_tags = local.common_tags
  # Storage Account
  sa-name     = var.sa-name
  sa-tier     = var.sa-tier
  sa-rep-type = var.sa-rep-type
  # Storage Container
  sc-name             = var.sc-name
  container-accs-type = var.container-accs-type
}

module "VirtualMachineModule" {
  source      = "./VirtualMachineModule"
  sa-tier     = module.StorageAccountModule.sa_type_output
  base-name   = var.base-name
  location    = var.location
  env         = terraform.workspace
  common_tags = local.common_tags
  # Network Interface
  ni-name            = var.ni-name
  ip-config-name     = var.ip-config-name
  priv-ip-addr-alloc = var.priv-ip-addr-alloc
  subnet-id          = module.NetworkModule.subnet_id_output
  # Public IP
  pip-name         = var.pip-name
  pip-alloc-method = var.pip-alloc-method
  # Virtual Machine
  vm-name     = var.vm-name
  vm-size     = var.vm-size
  vm-sku      = var.vm-sku
  vm-username = module.KeyVaultModule.key_vault_vm_username_output
  vm-password = module.KeyVaultModule.key_vault_vm_password_output
}
