variable "network_name" {}
variable "cidr_block" {}
variable "ssh_source_ips" {}
variable "sub_region" {}

variable "project_name" {}
variable "billing_account" {}
variable "org_id" {}
variable "region" {}

variable "labels" {
  description = "Project Labels."
  type        = map(string)
}