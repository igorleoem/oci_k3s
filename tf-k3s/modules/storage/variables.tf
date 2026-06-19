variable "compartment_ocid" {
  description = "OCI Compartment OCID"
  type        = string
}

variable "common_tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}
