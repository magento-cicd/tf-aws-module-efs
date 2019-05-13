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
  description = ""
}

variable "kms_key_id" {
  description = ""
}

variable "name" {
  description = ""
}

variable "subnet_ids" {
  description = ""
}

variable "vpc_id" {
  description = ""
}
