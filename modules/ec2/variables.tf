variable "machine-image" {
  type        = string
  description = "This is the AWS Machine Image for the EC2 instance"
  default     = "ami-0b5673b5f6e8f7fa7"
}

variable "machine-instance-type" {
  type        = string
  description = "This is the AMI instance type that will be used for the EC2 instance"
  default     = "t2.micro"

}

variable "public_subnet_id" {
  type        = string
  description = "The subnet ID of the public network"
  sensitive   = false
}

variable "private_subnet_id" {
  type        = string
  description = "The subnet ID of the private network"
  sensitive   = false
}
