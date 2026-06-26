resource "local_file" "argocd_apps" {
  filename = "${var.argocd_output_path}/applications.yaml"
  content = templatefile("${var.templates_path}/applications.yaml.tpl", {
    git_repo_url = var.git_repo_url
  })
}

resource "local_file" "cert_manager_kustomization" {
  filename = "${var.argocd_output_path}/infrastructure/cert-manager/kustomization.yaml"
  content  = file("${var.templates_path}/cert-manager/kustomization.yaml")
}

resource "local_file" "cert_manager_cluster_issuer" {
  filename = "${var.argocd_output_path}/infrastructure/cert-manager/cluster-issuer.yaml"
  content = templatefile("${var.templates_path}/cert-manager/cluster-issuer.yaml.tpl", {
    email = var.acme_email
  })
}

resource "local_file" "external_dns_kustomization" {
  filename = "${var.argocd_output_path}/infrastructure/external-dns/kustomization.yaml"
  content = templatefile("${var.templates_path}/external-dns/kustomization.yaml.tpl", {
    domain_name        = var.domain_name
    cloudflare_zone_id = var.cloudflare_zone_id
  })
}

resource "local_file" "external_dns_rbac" {
  for_each = { for f in fileset("${var.templates_path}/external-dns", "*.yaml*") : f => f if f != "kustomization.yaml.tpl" }
  filename = "${var.argocd_output_path}/infrastructure/external-dns/${replace(each.value, ".tpl", "")}"
  content  = file("${var.templates_path}/external-dns/${each.value}")
}

resource "local_file" "envoy_gateway_config" {
  filename = "${var.argocd_output_path}/infrastructure/envoy-gateway/config.yaml"
  content = templatefile("${var.templates_path}/envoy-gateway/config.yaml.tpl", {
    domain_name = var.domain_name
  })
}

resource "local_file" "envoy_gateway_kustomization" {
  filename = "${var.argocd_output_path}/infrastructure/envoy-gateway/kustomization.yaml"
  content  = file("${var.templates_path}/envoy-gateway/kustomization.yaml")
}

resource "local_file" "envoy_gateway_static_dns" {
  filename = "${var.argocd_output_path}/infrastructure/envoy-gateway/static-dns.yaml"
  content = templatefile("${var.templates_path}/envoy-gateway/static-dns.yaml.tpl", {
    domain_name       = var.domain_name
    ingress_public_ip = var.nlb_public_ip
  })
}

resource "local_file" "argocd_ingress_manifests" {
  filename = "${var.argocd_output_path}/infrastructure/argocd-ingress/ingress.yaml"
  content = templatefile("${var.templates_path}/argocd-ingress/ingress.yaml.tpl", {
    domain_name = var.domain_name
  })
}

resource "local_file" "argocd_self_managed" {
  filename = "${var.argocd_output_path}/infrastructure/argocd/kustomization.yaml"
  content  = file("${var.templates_path}/argocd/kustomization.yaml")
}

resource "local_file" "docs_manifests" {
  for_each = fileset("${var.templates_path}/docs", "*")
  filename = "${var.argocd_output_path}/apps/docs/${replace(each.value, ".tpl", "")}"
  content = templatefile("${var.templates_path}/docs/${each.value}", {
    domain_name       = var.domain_name
    git_username      = var.git_username
    git_repo_name     = var.git_repo_name
    ingress_public_ip = var.nlb_public_ip
  })
}

resource "local_file" "external_secrets_manifests" {
  for_each = fileset("${var.templates_path}/external-secrets", "*")
  filename = "${var.argocd_output_path}/infrastructure/external-secrets/${each.value}"
  content  = file("${var.templates_path}/external-secrets/${each.value}")
}

resource "local_file" "managed_secrets_kustomization" {
  filename = "${var.argocd_output_path}/infrastructure/managed-secrets/kustomization.yaml"
  content  = file("${var.templates_path}/managed-secrets/kustomization.yaml")
}

resource "local_file" "managed_secrets_secrets" {
  filename = "${var.argocd_output_path}/infrastructure/managed-secrets/secrets.yaml"
  content = templatefile("${var.templates_path}/managed-secrets/secrets.yaml.tpl", {
    vault_ocid   = var.vault_id
    oci_region   = var.oci_region
    git_username = var.git_username
    git_email    = var.git_email
    git_repo_url = var.git_repo_url
  })
}
