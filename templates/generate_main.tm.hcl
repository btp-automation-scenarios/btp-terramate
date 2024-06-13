generate_hcl "_terramate_generated_main.tf" {

  lets {
    stage = tm_upper(tm_element(terramate.stack.tags, 0))
  }

  content {
    # ------------------------------------------------------------------------------------------------------
    # Creation of directory
    # ------------------------------------------------------------------------------------------------------
    resource "btp_directory" "parent" {
      name        = "${var.unit}-${terramate.stack.name}"
      description = "This is the parent directory for ${var.unit} - ${terramate.stack.name}."
      labels      = { "architect" : ["${var.architect}"], "costcenter" : ["${var.costcenter}"], "owner" : ["${var.owner}"], "team" : ["${var.team}"] }
    }

    # ------------------------------------------------------------------------------------------------------
    # Call module for creating subaccoun
    # ------------------------------------------------------------------------------------------------------
    module "project_setup" {

      source = "${global.terraform.modules.btp_subaccount_module.source}"

      stage  = "${let.stage}"
      region = var.region

      unit                = var.unit
      unit_shortname      = var.unit_shortname
      architect           = var.architect
      costcenter          = var.costcenter
      owner               = var.owner
      team                = var.team
      emergency_admins    = var.emergency_admins
      parent_directory_id = btp_directory.parent.id
      usage               = tm_ternary(tm_contains(terramate.stack.tags, "dev"), "NOT_USED_FOR_PRODUCTION", "USED_FOR_PRODUCTION")
    }
  }
}
