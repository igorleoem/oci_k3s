variable "compartment_ocid" {
  description = "OCI Compartment OCID"
  type        = string
}

variable "common_tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}

variable "public_subnet_id" {
  description = "Public subnet OCID where the NLB will be created"
  type        = string
}

variable "ingress_instance_id" {
  description = "OCID of the ingress instance (NLB backend target)"
  type        = string
}
