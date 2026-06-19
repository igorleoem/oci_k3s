output "vault_id" {
  value       = oci_kms_vault.k3s_vault.id
  description = "OCI Vault OCID"
}

output "vault_management_endpoint" {
  value       = oci_kms_vault.k3s_vault.management_endpoint
  description = "OCI Vault management endpoint"
}

output "secret_ocids" {
  value = {
    cloudflare_api_token       = oci_vault_secret.cloudflare_api_token.id
    cloudflare_zone_id         = oci_vault_secret.cloudflare_zone_id.id
    domain_name                = oci_vault_secret.domain_name.id
    github_pat                 = oci_vault_secret.github_pat.id
    github_username            = oci_vault_secret.github_username.id
    git_repo_url               = oci_vault_secret.git_repo_url.id
    k3s_token                  = oci_vault_secret.k3s_token.id
    acme_email                 = oci_vault_secret.acme_email.id
    argocd_admin_password      = oci_vault_secret.argocd_admin_password.id
    argocd_admin_password_hash = oci_vault_secret.argocd_admin_password_hash.id
    ssh_public_key             = oci_vault_secret.ssh_public_key.id
  }
  description = "Map of secret names to their OCIDs"
  sensitive   = true
}
