#--------------------------------------
# efs module default variables example
# Notes: 
# Creation ~ 3 minutes
#  Destroy ~ 1 minute
#--------------------------------------

module "efs" {
  name = "efs-module-test-default"

  source = "../../module"

  vpc_id = ""

  subnet_ids = [""]
}
