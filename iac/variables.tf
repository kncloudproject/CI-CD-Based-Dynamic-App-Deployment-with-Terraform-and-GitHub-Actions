# Ensure S3 and DynamoDB Are Set Up for Remote State and Locking 
variable "Is_S3_DynamoDB_Configred" {
  description = "Confirm S3 and DynamoDB are Configured"
  type        = string
  validation {
    condition     = var.Is_S3_DynamoDB_Configred == "YES"
    error_message = "S3 Bucket and DynamoDB table must be set up and backend updated. Set Is_s3_dynamo_Configred to \"YES\"."
  }
}


# Confirm Route 53 Hosted Zone is Created and NS Records are Updated in GoDaddy
variable "is_hosted_zone_configured" {
  description = "Confirm Route 53 Hosted Zone is Created and NS Records are Updated in GoDaddy"
  type        = string
  validation {
    condition     = var.is_hosted_zone_configured == "YES"
    error_message = "Must create the Hosted Zone in Route 53 & Update NS records in GoDaddy, then set is_hosted_zone_configured to \"YES\"."
  }
}



# environment variables
variable "region" {
  description = "region to create resources"
  type        = string
}

variable "project_name" {
  description = "project name"
  type        = string
}

variable "environment" {
  description = "environment"
  type        = string
}

# vpc variables
variable "vpc_cidr" {
  description = "vpc cidr block"
  type        = string
}

variable "public_subnet_az1_cidr" {
  description = "public subnet az1 cidr block"
  type        = string
}

variable "public_subnet_az2_cidr" {
  description = "public subnet az2 cidr block"
  type        = string
}

variable "private_app_subnet_az1_cidr" {
  description = "private app subnet az1 cidr block"
  type        = string
}

variable "private_app_subnet_az2_cidr" {
  description = "private app subnet az2 cidr block"
  type        = string
}

variable "private_data_subnet_az1_cidr" {
  description = "private data subnet az1 cidr block"
  type        = string
}

variable "private_data_subnet_az2_cidr" {
  description = "private data subnet az2 cidr block"
  type        = string
}

# secrets manager variables
variable "secrets_manager_secret_name" {
  description = "the secrets manager secret name"
  type        = string
}

# rds variables
variable "multi_az_deployment" {
  description = "create a standby db instance"
  type        = bool
}

variable "database_instance_identifier" {
  description = "database instance identifier"
  type        = string
}

variable "database_instance_class" {
  description = "database instance type"
  type        = string
}

variable "publicly_accessible" {
  description = "controls if instance is publicly accessible"
  type        = bool
}

# acm variables
variable "domain_name" {
  description = "domain name"
  type        = string
}

variable "alternative_names" {
  description = "sub domain name"
  type        = string
}

# s3 variables
variable "env_file_bucket_name" {
  description = "s3 bucket name"
  type        = string
}

variable "env_file_name" {
  description = "env file name"
  type        = string
}

# ecs variables
variable "architecture" {
  description = "ecs cpu architecture"
  type        = string
}

variable "image_name" {
  description = "the docker image name"
  type        = string
}

variable "image_tag" {
  description = "the docker image tag"
  type        = string
}

# route-53 variables
variable "record_name" {
  description = "sub domain name"
  type        = string
}
