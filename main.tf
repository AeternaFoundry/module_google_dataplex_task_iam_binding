resource "google_dataplex_task_iam_binding" "dataplex_task_iam_bindings" {
  for_each = var.dataplex_task_iam_bindings

  lake     = each.value.lake
  members  = each.value.members
  role     = each.value.role
  task_id  = each.value.task_id
  location = each.value.location
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

