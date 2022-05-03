variable "region" {
  type        = string
  description = "region"
}

variable "env" {
  type        = string
  description = "Envirment (eg: dev, st, pr)"
}

variable "project" {
  type        = string
  description = "Project/Application name"
}

variable "create_ecr_repo" {
  type        = bool
  default     = false
  description = "whether to create ecr repo or not"
}

variable "tags" {
  type        = map(string)
  description = "Tags for aws resources"
}

variable "repositories" {
  description = "Settings for each repo"
  type = map(object({
    repo_name               = string
    image_tag_mutability    = string
    scan_images_on_push     = bool
    encryption_type         = string
    kms_key                 = any
    manage_repo_permissions = bool
    sid                     = string
    principals_arn          = list(any)
    principals_actions      = list(any)
    })
  )
}

