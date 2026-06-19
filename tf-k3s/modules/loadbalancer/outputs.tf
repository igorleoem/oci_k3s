output "nlb_public_ip" {
  value       = oci_network_load_balancer_network_load_balancer.k3s_nlb.ip_addresses[0].ip_address
  description = "Public IP of the Network Load Balancer"
}
