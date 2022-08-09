

output "instance_private_ip" {

  description = "Private IP address of the secondary2 EC2"
  value       = aws_instance.instance.private_ip
}

