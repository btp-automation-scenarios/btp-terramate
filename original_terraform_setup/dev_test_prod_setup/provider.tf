terraform {
  required_providers {
    btp = {
      source  = "sap/btp"
      version = "~> 1.4.0"
    }
  }
}

provider "btp" {
  globalaccount = var.globalaccount
}
