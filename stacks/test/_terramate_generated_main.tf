// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "btp_directory" "parent" {
  description = "This is the parent directory for ${var.unit} - testing."
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
  name = "${var.unit}-testing"
}
module "project_setup" {
  architect           = var.architect
  costcenter          = var.costcenter
  emergency_admins    = var.emergency_admins
  owner               = var.owner
  parent_directory_id = btp_directory.parent.id
  region              = var.region
  source              = "github.com/btp-automation-scenarios/btp-subaccount-module?ref=67cb61948e19497377fb4e23f01dd301319c6907"
  stage               = "TST"
  team                = var.team
  unit                = var.unit
  unit_shortname      = var.unit_shortname
  usage               = "USED_FOR_PRODUCTION"
}
