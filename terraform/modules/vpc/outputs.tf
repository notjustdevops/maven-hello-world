# /terraform/modules/vpc/outputs.tf

# Output the ID of the created VPC
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

# Output the CIDR block of the created VPC
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

# Output the IDs of public subnets
output "public_subnets" {
  description = "IDs of public subnets"
  value       = aws_subnet.public[*].id
}

# Output the IDs of private subnets
output "private_subnets" {
  description = "IDs of private subnets"
  value       = aws_subnet.private[*].id
}

# Output the ID of the Internet Gateway
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

# Output the IDs of the Route Tables
output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID of the private route table"
  value       = aws_route_table.private.id
}

# Output the ID of the NAT Gateway
output "nat_gateway_id" {
  description = "ID of the NAT gateway"
  value       = aws_nat_gateway.nat.id
}
