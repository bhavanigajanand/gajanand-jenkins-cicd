# --- CHANGE NAMES HERE FOR EVERY NEW PROJECT ---

variable "instance_name" {
  description = "The Name tag for your EC2 instance"
  type        = string
  default     = "gajanand-jenkins-Ubuntu-Server"
}

variable "key_name" {
  description = "The name of the key pair to create"
  type        = string
  default     = "gajanand-jenkins-key" 
}

variable "aws_region" {
  description = "Target AWS Region"
  type        = string
  default     = "eu-central-1" 
}

variable "ami_id" {
  description = "Ubuntu 24.04 LTS AMI for Frankfurt"
  type        = string
  default     = "ami-05852c5f195d545ea" 
}

variable "instance_type" {
  description = "Size of the server"
  type        = string
  default     = "t3.medium" # <-- CHANGE SIZE HERE (Free Tier)
}