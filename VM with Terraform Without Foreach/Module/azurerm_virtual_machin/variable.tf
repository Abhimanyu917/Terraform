variable "nic_name" {
  description = "The name of the network interface."
  type        = string

}
variable "rg_name" {
  description = "The name of the resource group where the network interface will be created."
  type        = string

}
variable "resource_group_location" {
  description = "The location of the resource group where the network interface will be created."
  type        = string

}
variable "subnet_id" {
  description = "The ID of the subnet where the network interface will be created."
  type        = string
  
}
variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  
}
variable "vm_size" {
  description = "The location where the virtual machine will be created."
  type        = string
  
}
variable "admin_username" {
  description = "The name of the resource group where the virtual machine will be created."
  type        = string
  
}
  
variable "admin_password" {
  description = "The password for the virtual machine administrator."
  type        = string
  
}
variable "image_publisher" {
  description = "The publisher of the image to be used for the virtual machine."
  type        = string
  
}
variable "image_offer" {
  description = "The offer of the image to be used for the virtual machine."
  type        = string
  
}
variable "image_sku" {
  description = "The SKU of the image to be used for the virtual machine."
  type        = string
  
}
variable "image_version" {
  description = "The version of the image to be used for the virtual machine."
  type        = string
  
}
variable "pip" {
  description = "The ID of the public IP address to be associated with the network interface."
  type        = string
  
}