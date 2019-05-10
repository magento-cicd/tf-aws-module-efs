#--------------------------------------
# efs module default variables example
# Notes: 
# Creation ~ 3-15 minutes
#  Destroy ~ 1-10 minutes
#--------------------------------------

module "efs" {
  name = "efs-module-test-default"

  kms_key_id = ""

  source = "../../modules/efs"

  vpc_id = "vpc-"

  subnet_ids = [
    "subnet-",
    "subnet-",
    "subnet-",
  ]
}
