# Retrieve created subnet 
variable "public_subnet" {
  description = "This is the public subnet that will be used for the load balancer"
}


variable "VPC_id" {
  description = "The ID of the VPC"
}

variable "public_instance_id" {
  description = "This is the ID of the public instance"
}
