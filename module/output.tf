#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ELASTIC FILE SYSTEM MODULE OUTPUT
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

output "efs_arn" {
  description = "Amazon Resource Name of the file system."
  value       = "${aws_efs_mount_target.main.0.dns_name}"
}

output "efs_id" {
  description = "The ID that identifies the file system (e.g. fs-ccfc0d65)."
  value       = "${aws_efs_mount_target.main.0.dns_name}"
}

output "efs_dns_name" {
  description = "The DNS name for the filesystem per documented convention."
  value       = "${aws_efs_mount_target.main.0.dns_name}"
}

# Why only the first one?
# DNS is the same in all subnets and routes 
# to correct mountpoint target ip in each subnet.
output "mount_target_dns" {
  description = "Address of the mount target provisioned."
  value       = "${aws_efs_mount_target.main.0.dns_name}"
}

output "mount_target_network_interface_ids" {
  description = "List of mount target network interface ids."
  value       = ["${aws_efs_mount_target.main.*.network_interface_id}"]
}

output "efs_security_group_id" {
  description = "The default security group of the efs mount target network interface ids"
  value       = "${aws_security_group.efs.id}"
}
