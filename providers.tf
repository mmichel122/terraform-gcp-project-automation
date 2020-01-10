provider "google" {
  alias       = "default"
  credentials = file("/Users/MMR12/Secrets/management-251910-5f38e61bb0b2.json")
  region      = var.region
  version     = "~> 3.0.0"
}