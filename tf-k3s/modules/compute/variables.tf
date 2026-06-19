variable "compartment_ocid" {
  description = "OCI Compartment OCID"
  type        = string
}

variable "common_tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key for instances"
  type        = string
}

variable "vcn_id" {
  description = "VCN OCID"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet OCID (for ingress instance)"
  type        = string
}

variable "private_sl_id" {
  description = "Private security list OCID (for private subnet)"
  type        = string
}

variable "ingress_private_ip" {
  description = "Static private IP for the ingress/NAT node"
  type        = string
}

variable "k3s_token" {
  description = "Shared K3s cluster secret"
  type        = string
  sensitive   = true
}

variable "git_repo_url" {
  description = "Git repository URL for ArgoCD bootstrap"
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

variable "cloudflare_api_token" {
  description = "Cloudflare API token (injected into server cloud-init)"
  type        = string
  sensitive   = true
}
