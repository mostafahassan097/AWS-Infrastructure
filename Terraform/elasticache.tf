resource "aws_elasticache_subnet_group" "my-elasticache-subgrp" {
  name       = "my-elasticache-subgrp"
  subnet_ids = [module.network.pri_sub_1, module.network.pri_sub_2]
}    
resource "aws_elasticache_cluster" "myelasticache" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  availability_zone    =   var.az-1
  security_group_ids   =  [aws_security_group.securitygroup-1.id,aws_security_group.securitygroup-2.id]
  subnet_group_name    = aws_elasticache_subnet_group.my-elasticache-subgrp.name
}