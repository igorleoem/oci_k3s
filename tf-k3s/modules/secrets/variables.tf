variable "compartment_ocid" {
  description = "OCI Compartment OCID"
  type        = string
}

variable "common_tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key (stored as a vault secret)"
  type        = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the cluster"
  type        = string
}

variable "git_pat" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "git_username" {
  description = "GitHub username"
  type        = string
}

variable "git_repo_url" {
  description = "Git repository URL"
  type        = string
}

variable "k3s_token" {
  description = "Shared K3s cluster secret"
  type        = string
  sensitive   = true
}

variable "acme_email" {
  description = "Email for Let's Encrypt ACME"
  type        = string
}

variable "argocd_admin_password" {
  description = "ArgoCD admin password"
  type        = string
  sensitive   = true
}

variable "argocd_admin_password_hash" {
  description = "Bcrypt hash of ArgoCD admin password"
  type        = string
  sensitive   = true
}
