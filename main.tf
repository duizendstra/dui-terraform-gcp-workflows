terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.38.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 5.38.0"
    }
  }
}

resource "google_workflows_workflow" "main" {
  for_each = { for wf in var.workflows : wf.name => wf }

  project     = var.project_id
  name        = each.value.name
  region      = var.region
  description = each.value.description

  source_contents = templatefile("workflow-files/${each.value.source_file}", {
    project   = var.project_id
    api_hosts = var.api_hosts
    datasets  = var.datasets
    tables    = var.tables
  })

  service_account = var.service_account_email
}

