variable "compartment_ocid" {
  description = "OCI Compartment OCID"
  type        = string
}

variable "common_tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}

variable "ssh_source_cidr" {
  description = "CIDR block allowed to SSH into the ingress node"
  type        = string
}
