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

module "workflows" {
  source                = "./.."
  project_id            = "your_project_id"
  service_account_email = "your_service_account_email"
  tables = {
    table_01 = {
      id       = "your_project_id-dev-e4b3.your-dataset.table_01"
      table_id = "table_01"
    }
    table_02 = {
      id       = "your_project_id-dev-e4b3.your-dataset.table_02"
      table_id = "table_01"
    }
  }
  datasets = {
    dataset_01 = {
      dataset_id    = "your_first_dataset"
      description   = "your_first_dataset"
      friendly_name = "your_first_dataset"
      location      = "EU"
    }
    dataset_02 = {
      dataset_id    = "your_second_dataset"
      description   = "your_second_dataset"
      friendly_name = "your_second_dataset"
      location      = "EU"
    }
  }
  api_hosts = {
    your_first_api_host  = "your_first_api_host"
    your_second_api_host = "your_second_api_host"
  }
  workflows = [
    {
      name        = "your_workflow_name"
      description = "Your workflow description"
      source_file = "example.yaml"
    }
  ]
}
