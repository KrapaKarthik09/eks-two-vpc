region = "ap-southeast-1"
### Cluster
eks_cluster_name = "CLUSTER-MY2"
eks_cluster_version = "1.23"

### Linux Nodegroup
lin_desired_size = "1"
lin_max_size = "2"
lin_min_size = "1"
lin_instance_type = "t2.micro"

### Windows Nodegroup
win_desired_size = "1"
win_max_size = "2"
win_min_size = "1"
win_instance_type = "t2.micro"


public_subnets = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]

