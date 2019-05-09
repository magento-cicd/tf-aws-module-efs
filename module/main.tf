#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# AWS ELASTIC FILE SYSTEM MODULE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#---------------
# EFS
#---------------
# Note: Cannot have EFS assigned to subnets in multiple VPCs.
# To mount in another VPC remove all existing VPC mounts, then ones from other VPC.
resource "aws_efs_file_system" "main" {
  creation_token                  = "${var.creation_token}"
  encrypted                       = "${var.encrypted}"
  kms_key_id                      = "${var.kms_key_id}"
  performance_mode                = "${var.performance_mode}"
  provisioned_throughput_in_mibps = "${var.provisioned_throughput_in_mibps}"
  throughput_mode                 = "${var.throughput_mode}"
  tags                            = "${merge(map("Name", "${var.name}"), var.tags)}"
}

# Create EFS mount targets in var.subnet_ids
resource "aws_efs_mount_target" "main" {
  count = "${length(var.subnet_ids)}"

  file_system_id = "${aws_efs_file_system.main.id}"
  subnet_id      = "${element(var.subnet_ids, count.index)}"

  security_groups = [
    "${aws_security_group.efs.id}",
  ]
}

#----------------------------------------
# Default EFS Security Group
# Allow ingress and egress for port 2049 (NFS)
#----------------------------------------
resource "aws_security_group" "efs" {
  name        = "${var.name}-efs-mount"
  description = "Allow NFS traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = 2049
    to_port   = 2049
    protocol  = "tcp"
  }

  egress {
    from_port = 2049
    to_port   = 2049
    protocol  = "tcp"
  }

  tags = "${merge(map("Name", "${var.name}-efs-mount"), var.tags)}"
}
