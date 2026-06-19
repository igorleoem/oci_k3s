data "oci_objectstorage_namespace" "ns" {
  compartment_id = var.compartment_ocid
}

resource "oci_objectstorage_bucket" "tfstate" {
  compartment_id = var.compartment_ocid
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  name           = "k3s-tfstate"
  access_type    = "NoPublicAccess"
  versioning     = "Enabled"
  freeform_tags  = var.common_tags
}
