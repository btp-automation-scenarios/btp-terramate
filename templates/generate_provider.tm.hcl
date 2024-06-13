generate_hcl "_terramate_generated_provider.tf" {
  content {
    terraform {
      required_version = tm_ternary(tm_contains(terramate.stack.tags, "dev"), global.terraform.version_dev, global.terraform.version)

      required_providers {
        btp = {
          source  = "SAP/btp"
          version = tm_ternary(tm_contains(terramate.stack.tags, "dev"), global.terraform.providers.btp.version_dev, global.terraform.providers.btp.version)
        }
      }
    }
    provider "btp" {
      globalaccount = var.globalaccount
    }
  }
}