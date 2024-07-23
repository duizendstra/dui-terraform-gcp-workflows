variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region where the workflows will be deployed"
  type        = string
  default     = "europe-west1"
}

variable "service_account_email" {
  description = "The email of the service account to use for the workflow"
  type        = string
}

variable "workflows" {
  description = "A list of workflows to create"
  type = list(object({
    name        = string
    description = string
    source_file = string
  }))
  default = []
}

variable "datasets" {
  description = "Map of tables"
  type = map(object({
    dataset_id    = string
    description   = string
    friendly_name = string
    location      = string
  }))
  default = {}
}

variable "tables" {
  description = "Map of tables"
  type = map(object({
    id       = string
    table_id = string
  }))
  default = {}
}

variable "api_hosts" {
  description = "Map of API hosts for workflows"
  type = map(object({
    name = string
    url  = string
  }))
  default = {}
}
