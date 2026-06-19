output "bucket_name" {
  value       = oci_objectstorage_bucket.tfstate.name
  description = "Object Storage bucket name for Terraform state backend"
}

output "bucket_namespace" {
  value       = data.oci_objectstorage_namespace.ns.namespace
  description = "Object Storage namespace for backend configuration"
}
