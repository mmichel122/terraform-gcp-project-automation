# Create random 4 character number after the project name.
resource "random_id" "id" {
  byte_length = 2
  prefix      = "${var.project_name}-"
}

# Create the project (under folder parent or org)
resource "google_project" "project" {
  name            = random_id.id.hex
  project_id      = random_id.id.hex
  billing_account = var.billing_account
  auto_create_network = false
  #org_id          = var.org_id # Create the project under the organisation.
  folder_id = "520705726561" # Create the project under folder parent.
  labels    = var.labels
}

/***
# Create a folder parent to the project, org_id and folder_id will need to be removed.
resource "google_folder" "dept" {
  display_name = "Demo"
  parent       = "oorganizations/1056595799590"
}
***/

# enable default service to consume.
resource "google_project_service" "service" {
  for_each = toset([
    "compute.googleapis.com"
  ])

  service = each.key

  project            = google_project.project.project_id
  disable_on_destroy = false
}

