output "instance_ip_address" {
  value = aws_instance.web.public_ip
}

output "instance_dns_name" {
  value = aws_instance.web.public_dns
}

output "instance_id" {
  value = aws_instance.web.id
}
