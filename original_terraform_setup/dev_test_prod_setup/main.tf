# ------------------------------------------------------------------------------------------------------
# Creation of directory
# ------------------------------------------------------------------------------------------------------
resource "btp_directory" "parent" {
  name        = var.unit
  description = "This is the parent directory for ${var.unit}."
  labels      = { "architect" : ["${var.architect}"], "costcenter" : ["${var.costcenter}"], "owner" : ["${var.owner}"], "team" : ["${var.team}"] }
}

# ------------------------------------------------------------------------------------------------------
# Call module for creating subaccoun
# ------------------------------------------------------------------------------------------------------
module "project_setup" {

  for_each = toset("${var.landscapes}")
  source   = "github.com/btp-automation-scenarios/btp-subaccount-module"

  stage  = each.value
  region = var.region

  unit                = var.unit
  unit_shortname      = var.unit_shortname
  architect           = var.architect
  costcenter          = var.costcenter
  owner               = var.owner
  team                = var.team
  emergency_admins    = var.emergency_admins
  parent_directory_id = btp_directory.parent.id
  usage               = "USED_FOR_PRODUCTION"
}
