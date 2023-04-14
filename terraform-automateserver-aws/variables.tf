variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0caf778a172362f1c" # Amazon ubuntu 20.x.x 
}

variable "instance_type" {
  description = "Instance type for EC2 instance"
  default     = "t2.large"
}

variable "key_name" {
  description = "The name of the EC2 key pair to associate with the instance."
}

variable "existing_vpc_id" {
  description = "The ID of an existing VPC to use."
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group to attach to the EC2 instance."
}
variable "key_pair_public_key" {
  description = "The file path to the public key of the EC2 key pair to associate with the instance."
}

variable "instance_count" {
  default = 1
}



