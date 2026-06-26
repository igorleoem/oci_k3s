variable "argocd_output_path" {
  description = "Absolute path to the argocd/ directory where manifests will be written"
  type        = string
}

variable "templates_path" {
  description = "Absolute path to the templates/manifests/ directory"
  type        = string
}

variable "git_repo_url" {
  description = "Git repository URL for ArgoCD root application"
  type        = string
}

variable "domain_name" {
  description = "Base domain name for the cluster"
  type        = string
}

variable "acme_email" {
  description = "Email for Let's Encrypt ACME"
  type        = string
}

variable "git_username" {
  description = "GitHub username (used for GHCR image paths)"
  type        = string
}

variable "git_repo_name" {
  description = "Repository name (used for GHCR image paths)"
  type        = string
}

variable "git_email" {
  description = "GitHub email address"
  type        = string
}

variable "nlb_public_ip" {
  description = "Public IP of the Network Load Balancer"
  type        = string
}

variable "vault_id" {
  description = "OCI Vault OCID"
  type        = string
}

variable "oci_region" {
  description = "OCI region"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID for External DNS zone filtering"
  type        = string
}
