output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.external-elb.dns_name
}

output "Application_Instance_IP" {
  value = aws_instance.ApplicatoinInstance.private_ip
}

output "Bastion_Instance_IP" {
  value = aws_instance.BastionInstance.public_ip
}

output "RDS_HOSTNAME" {
   value = aws_db_instance.my_rds.address
}

output "RDS_PORT" {
   value = aws_db_instance.my_rds.port
}

output "REDIS_HOSTNAME" {
   value = aws_elasticache_cluster.myelasticache.cache_nodes[0].endpoint.address

#    output "hostname" {
#   value = "${aws_elasticache_cluster.redis.cache_nodes.0.address}"
}


output "REDIS_PORT" {
   value = aws_elasticache_cluster.myelasticache.port
}