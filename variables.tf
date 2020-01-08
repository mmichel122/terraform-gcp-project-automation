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
  default = {
    billing_team = "group_tv"
    cost_centre  = "2002193029"
    budget_owner        = "mikael_michelier"
    finance_analyst     = "nisha_rajput"
    environment         = "nonprod"
    requester           = "mikael_michelier"
    billing_alert_level = "300"
  }
}