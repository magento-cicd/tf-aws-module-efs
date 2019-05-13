# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------
variable "aws_region" {
  type = "string"
}

variable "kms_key_id" {
  type = "string"
}

variable "name" {
  type = "string"
}

variable "subnet_ids" {
  type = "list"
}

variable "vpc_id" {
  type = "string"
}
