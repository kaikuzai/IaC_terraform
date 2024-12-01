variable "cidr_block_vpc" {
  type        = string
  description = "This is the CIDR block that will be assigned to the VPC"
  default     = "10.0.0.0/16"
  sensitive   = false
}

variable "cidr_block_subnet_A1" {
  type        = string
  description = "This is the CIDR block that will be assigned to subnet B"
  sensitive   = true
  default     = "10.0.0.0/24"
}
variable "cidr_block_subnet_A2" {
  type        = string
  description = "This is the CIDR block that will be assigned to subnet B"
  sensitive   = true
  default     = "10.0.1.0/24"
}

variable "cidr_block_subnet_B" {
  type        = string
  description = "This is the CIDR block that will be assigned to subnet B"
  sensitive   = true
  default     = "10.0.2.0/24"
}
