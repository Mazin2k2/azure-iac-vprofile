variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "vprofile-aks-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "vprofile-vnet"
}

variable "vnet_address_space" {
  description = "CIDR for the VNet"
  type        = list(string)
  default     = ["172.20.0.0/16"]
}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)
  default     = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"]
}

variable "private_subnets" {
  description = "Private subnets"
  type        = list(string)
  default     = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]
}
