output "workflows" {
  description = "Details of the created workflows"
  value = { for name, wf in google_workflows_workflow.main : name => {
    name          = wf.name
    execution_url = "https://workflowexecutions.googleapis.com/v1/projects/${var.project_id}/locations/${var.region}/workflows/${wf.name}/executions"
  } }
}