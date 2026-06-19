output "vcn_id" {
  value       = oci_core_vcn.k3s_vcn.id
  description = "VCN OCID"
}

output "public_subnet_id" {
  value       = oci_core_subnet.public_subnet.id
  description = "Public subnet OCID"
}

output "private_sl_id" {
  value       = oci_core_security_list.private_sl.id
  description = "Private security list OCID (used by compute to create private subnet)"
}
