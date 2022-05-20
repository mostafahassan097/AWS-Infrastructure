output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.external-elb.dns_name
}

output "Private Instance Ip" {
  value = aws_instance.ApplicatoinInstance.private_ip
}

output "Public Instance Ip" {
  value = aws_instance.BastionInstance.public_ip
}

output "RDS_HOSTNAME" {
   value = aws_db_instance.my_rds.endpoint
}

output "RDS_PORT" {
   value = aws_db_instance.my_rds.port
}

output "REDIS_HOSTNAME" {
   value = aws_elasticache_cluster.myelasticache.cluster_address
}

output "REDIS_PORT" {
   value = aws_elasticache_cluster.myelasticache.port
}