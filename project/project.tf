resource "random_id" "id" {
  byte_length = 4
  prefix      = "${var.project_name}-"
}

resource "google_project" "project" {
  name            = random_id.id.hex
  project_id      = random_id.id.hex
  billing_account = var.billing_account
  auto_create_network = false
  #org_id          = var.org_id
  labels    = var.labels
  folder_id = "520705726561"
}

/***
resource "google_folder" "dept" {
  display_name = "Demo"
  parent       = "oorganizations/1056595799590"
}
***/

resource "google_project_service" "service" {
  for_each = toset([
    "compute.googleapis.com"
  ])

  service = each.key

  project            = google_project.project.project_id
  disable_on_destroy = false
}

