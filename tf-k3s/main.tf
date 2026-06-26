module "storage" {
  source           = "./modules/storage"
  compartment_ocid = var.compartment_ocid
  common_tags      = var.common_tags
}

module "iam" {
  source           = "./modules/iam"
  tenancy_ocid     = var.tenancy_ocid
  compartment_ocid = var.compartment_ocid
}

module "secrets" {
  source                     = "./modules/secrets"
  compartment_ocid           = var.compartment_ocid
  common_tags                = var.common_tags
  ssh_public_key_path        = var.ssh_public_key_path
  cloudflare_api_token       = var.cloudflare_api_token
  cloudflare_zone_id         = var.cloudflare_zone_id
  domain_name                = var.domain_name
  git_pat                    = var.git_pat
  git_username               = var.git_username
  git_repo_url               = var.git_repo_url
  k3s_token                  = var.k3s_token
  acme_email                 = var.acme_email
  argocd_admin_password      = var.argocd_admin_password
  argocd_admin_password_hash = var.argocd_admin_password_hash
}

module "networking" {
  source           = "./modules/networking"
  compartment_ocid = var.compartment_ocid
  common_tags      = var.common_tags
  ssh_source_cidr  = var.ssh_source_cidr
}

module "compute" {
  source               = "./modules/compute"
  compartment_ocid     = var.compartment_ocid
  common_tags          = var.common_tags
  ssh_public_key_path  = var.ssh_public_key_path
  vcn_id               = module.networking.vcn_id
  public_subnet_id     = module.networking.public_subnet_id
  private_sl_id        = module.networking.private_sl_id
  ingress_private_ip   = var.ingress_private_ip
  k3s_token            = var.k3s_token
  git_repo_url         = var.git_repo_url
  git_pat              = var.git_pat
  git_username         = var.git_username
  cloudflare_api_token = var.cloudflare_api_token
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  compartment_ocid    = var.compartment_ocid
  common_tags         = var.common_tags
  public_subnet_id    = module.networking.public_subnet_id
  ingress_instance_id = module.compute.ingress_instance_id
}

module "manifests" {
  source              = "./modules/manifests"
  argocd_output_path  = "${path.module}/../argocd"
  templates_path      = "${path.module}/templates/manifests"
  git_repo_url        = var.git_repo_url
  domain_name         = var.domain_name
  acme_email          = var.acme_email
  git_username        = var.git_username
  git_repo_name       = var.git_repo_name
  git_email           = var.git_email
  nlb_public_ip       = module.loadbalancer.nlb_public_ip
  vault_id            = module.secrets.vault_id
  oci_region          = var.region
  cloudflare_zone_id  = var.cloudflare_zone_id
}
