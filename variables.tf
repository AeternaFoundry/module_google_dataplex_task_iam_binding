variable "dataplex_task_iam_bindings" {
  description = <<EOT
Map of dataplex_task_iam_bindings, attributes below
Required:
    - lake
    - members
    - role
    - task_id
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    lake     = string
    members  = set(string)
    role     = string
    task_id  = string
    location = optional(string)
    project  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

