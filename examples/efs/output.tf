output "efs_arn" {
  description = "Amazon Resource Name of the file system."
  value       = "${module.efs.efs_arn}"
}

output "efs_id" {
  description = "The ID that identifies the file system (e.g. fs-ccfc0d65)."
  value       = "${module.efs.efs_id}"
}

output "efs_dns_name" {
  description = "The DNS name for the filesystem per documented convention."
  value       = "${module.efs.efs_dns_name}"
}

output "mount_target_dns" {
  description = "Address of the mount target provisioned."

  # DNS for mountpoints is the same in all subnets
  value = "${module.efs.mount_target_dns}"
}

output "mount_target_ids" {
  description = "List of mount target AWS resource IDs"
  value       = "${module.efs.mount_target_ids}"
}

output "mount_target_network_interface_ids" {
  description = "List of mount target network interface ids."
  value       = "${module.efs.mount_target_network_interface_ids}"
}

output "efs_security_group_id" {
  description = "The default security group of the efs mount target network interface ids"
  value       = "${module.efs.efs_security_group_id}"
}
