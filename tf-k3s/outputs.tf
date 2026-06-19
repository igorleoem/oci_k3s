output "ingress_public_ip" {
  value = module.compute.ingress_public_ip
}

output "load_balancer_ip" {
  value = module.loadbalancer.nlb_public_ip
}

output "server_private_ip" {
  value = module.compute.server_private_ip
}

output "worker_private_ip" {
  value = module.compute.worker_private_ip
}

output "kubeconfig_command" {
  value = "ssh -i ${var.private_key_path} ubuntu@${module.compute.ingress_public_ip} 'ssh ubuntu@10.0.2.10 sudo cat /etc/rancher/k3s/k3s.yaml'"
}

output "domain_url" {
  value = "https://${var.domain_name}"
}

output "tfstate_bucket" {
  value       = module.storage.bucket_name
  description = "Object Storage bucket name for Terraform state backend"
}

output "tfstate_namespace" {
  value       = module.storage.bucket_namespace
  description = "Object Storage namespace for backend configuration"
}

output "next_steps" {
  value = <<EOT
1. Copy the generated files from 'argocd/' to your Git repository: ${var.git_repo_url}
2. Push the changes to the repository.
3. Wait for the instances to provision and K3s to install.
4. Verify Argo CD status:
   ssh -J ubuntu@${module.compute.ingress_public_ip} ubuntu@10.0.2.10 "sudo kubectl get applications -n argocd"
EOT
}
