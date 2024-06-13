generate_hcl "_terramate_generated_variables.tf" {
  content {
    variable "globalaccount" {
      type        = string
      description = "The globalaccount subdomain where the sub account shall be created."
    }

    variable "region" {
      type        = string
      description = "The region where the account shall be created in."
      default     = "us10"
    }

    variable "unit" {
      type        = string
      description = "Defines to which organisation the sub account shall belong to."
      default     = "Sales"
    }

    variable "unit_shortname" {
      type        = string
      description = "Short name for the organisation the sub account shall belong to."
      default     = "sls"
    }

    variable "architect" {
      type        = string
      description = "Defines the email address of the architect for the subaccount"
      default     = "genius.architect@test.com"
    }

    variable "costcenter" {
      type        = string
      description = "Defines the costcenter for the subaccount"
      default     = "1234509874"
    }

    variable "owner" {
      type        = string
      description = "Defines the owner of the subaccount"
      default     = "someowner@test.com"
    }

    variable "team" {
      type        = string
      description = "Defines the team of the sub account"
      default     = "awesome_dev_team@test.com"
    }

    variable "emergency_admins" {
      type        = list(string)
      description = "Defines the colleagues who are added to each subaccount as emergency administrators."
      default     = tm_ternary(tm_contains(terramate.stack.tags, "dev"), ["somearchitect@test.com"], ["jane.doe@test.com", "john.doe@test.com"])
    }

    variable "entitlements" {
      description = "List of entitlements for a BTP subaccount"
      type = list(object({
        group  = string
        type   = string
        name   = string
        plan   = string
        amount = number
      }))

      default = [
        {
          group  = "Audit + Application Log"
          type   = "service"
          name   = "auditlog-viewer"
          plan   = "free"
          amount = null
        },
        {
          group  = "Alert"
          type   = "service"
          name   = "alert-notification"
          plan   = "standard"
          amount = null
        },
        {
          group  = "SAP HANA Cloud"
          type   = "service"
          name   = "hana-cloud"
          plan   = tm_ternary(tm_contains(terramate.stack.tags, "dev"), "free", "hana")
          amount = null
        },
        {
          group  = "SAP HANA Cloud"
          type   = "service"
          name   = "hana"
          plan   = "hdi-shared"
          amount = null
        }
      ]
    }
  }
}