output "public_subnetA1_id" {
  value = aws_subnet.subnet_A1.id
}

output "public_subnetA2_id" {
  value = aws_subnet.subnet_A2.id
}

output "public_subnets" {
  value = [aws_subnet.subnet_A1, aws_subnet.subnet_A2]
}

output "private_subnet_id" {
  value = aws_subnet.subnet_B.id
}

output "virtual_private_cloud_id" {
  value = aws_vpc.main_vpc.id
}
