// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "btp_directory" "parent" {
  description = "This is the parent directory for ${var.unit} - development."
  labels = {
    "architect" = [
      "${var.architect}",
    ]
    "costcenter" = [
      "${var.costcenter}",
    ]
    "owner" = [
      "${var.owner}",
    ]
    "team" = [
      "${var.team}",
    ]
  }
  name = "${var.unit}-development"
}
module "project_setup" {
  architect           = var.architect
  costcenter          = var.costcenter
  emergency_admins    = var.emergency_admins
  owner               = var.owner
  parent_directory_id = btp_directory.parent.id
  region              = var.region
  source              = "github.com/btp-automation-scenarios/btp-subaccount-module?ref=67cb61948e19497377fb4e23f01dd301319c6907"
  stage               = "DEV"
  team                = var.team
  unit                = var.unit
  unit_shortname      = var.unit_shortname
  usage               = "NOT_USED_FOR_PRODUCTION"
}
