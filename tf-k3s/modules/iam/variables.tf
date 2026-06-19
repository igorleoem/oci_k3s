variable "tenancy_ocid" {
  description = "OCI Tenancy OCID (IAM resources are created at tenancy level)"
  type        = string
}

variable "compartment_ocid" {
  description = "OCI Compartment OCID"
  type        = string
}
