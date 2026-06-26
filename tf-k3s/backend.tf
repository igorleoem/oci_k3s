# Terraform Remote State Backend — OCI Object Storage (S3-compatible)
#
# PREREQUISITES before running terraform init:
#   1. Generate OCI Customer Secret Keys:
#      OCI Console → Profile → User Settings → Customer Secret Keys → Generate Secret Key
#      Save both keys immediately — the secret is shown only once.
#      Access Key  → AWS_ACCESS_KEY_ID
#      Secret Key  → AWS_SECRET_ACCESS_KEY
#
#   2. Export the keys in your shell:
#      export AWS_ACCESS_KEY_ID="<your-access-key>"
#      export AWS_SECRET_ACCESS_KEY="<your-secret-key>"
#
#   3. Run: terraform init -migrate-state
#
# BUCKET:    k3s-tfstate (provisioned by modules/storage)
# NAMESPACE: idlam3ku7ae7

terraform {
  backend "s3" {
    bucket = "bkt_remote_state"
    key    = "terraform.tfstate"
    region = "us-ashburn-1"

    endpoints = {
      s3 = "https://idiry3fl5gsx.objectstorage.us-ashburn-1.oci.customer-oci.com"
    }

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    use_path_style              = true
    skip_s3_checksum            = true
  }
}
