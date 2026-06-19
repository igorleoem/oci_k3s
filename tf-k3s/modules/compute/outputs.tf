output "ingress_public_ip" {
  value       = oci_core_instance.ingress.public_ip
  description = "Public IP of the ingress/NAT instance"
}

output "ingress_instance_id" {
  value       = oci_core_instance.ingress.id
  description = "OCID of the ingress instance"
}

output "server_private_ip" {
  value       = oci_core_instance.server.private_ip
  description = "Private IP of the K3s server instance"
}

output "worker_private_ip" {
  value       = oci_core_instance.worker.private_ip
  description = "Private IP of the K3s worker instance"
}

output "private_subnet_id" {
  value       = oci_core_subnet.private_subnet.id
  description = "Private subnet OCID"
}
