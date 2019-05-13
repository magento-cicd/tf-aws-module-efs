#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ELASTIC FILE SYSTEM MODULE OUTPUT
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

output "efs_arn" {
  description = "Amazon Resource Name of the file system."
  value       = "${aws_efs_file_system.efs.arn}"
}

output "efs_id" {
  description = "The ID that identifies the file system (e.g. fs-ccfc0d65)."
  value       = "${aws_efs_file_system.efs.id}"
}

output "efs_dns_name" {
  description = "The DNS name for the filesystem per documented convention."
  value       = "${aws_efs_file_system.efs.dns_name}"
}

output "mount_target_dns" {
  description = "Address of the mount target provisioned."

  # DNS for mountpoints is the same in all subnets
  value = "${aws_efs_mount_target.efs.0.dns_name}"
}

output "mount_target_ids" {
  description = "List of mount target AWS resource IDs"
  value       = "${join(",", aws_efs_mount_target.efs.*.id)}"
}

output "mount_target_network_interface_ids" {
  description = "List of mount target network interface ids."
  value       = "${aws_efs_mount_target.efs.*.network_interface_id}"
}

output "efs_security_group_id" {
  description = "The default security group of the efs mount target network interface ids"
  value       = "${aws_security_group.efs.id}"
}
