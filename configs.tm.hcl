// Configure default Terraform version and default providers
globals "terraform" {
  version     = ">= 1.6.0"
  version_dev = ">= 1.8.0"
}

globals "terraform" "providers" "btp" {
  version     = "~> 1.4.0"
  version_dev = "~> 1.4.0"
}

globals "terraform" "modules" "btp_subaccount_module" {
  source = "github.com/btp-automation-scenarios/btp-subaccount-module?ref=67cb61948e19497377fb4e23f01dd301319c6907"
}
