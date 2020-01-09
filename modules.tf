module "project" {
    source = "./modules/project"
    project_name = var.project_name
    billing_account = var.billing_account
    org_id = var.org_id
    region = var.region
}

module "network" {
    source = "./modules/network"
    network_name   = var.network_name
    cidr_block     = var.cidr_block
    ssh_source_ips = var.ssh_source_ips 
    region         = var.sub_region
    project        = module.project.project_id
}
