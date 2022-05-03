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


variable "scan_images_on_push" {
  type        = bool
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not (false)"
  default     = true
}


variable "repo_name" {
  type        = string
  description = "List of Docker local image names, used as repository names for AWS ECR "
}

variable "image_tag_mutability" {
  type        = string
  default     = "IMMUTABLE"
  description = "The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE`"
}



variable "tags" {
  type        = map(string)
  description = "Tags for aws resources"
}

variable "encryption_type" {
  description = "The encryption type to use for the repository. Valid values are `AES256` or `KMS`"
  type        = string
  default     = "KMS"
}

# KMS key
variable "kms_key" {
  description = "The ARN of the KMS key to use when encryption_type is `KMS`. If not specified when encryption_type is `KMS`, uses a new KMS key. Otherwise, uses the default AWS managed key for ECR."
  type        = string
  default     = null
}

variable "create_ecr_repo" {
  type        = bool
  default     = false
  description = "whether to create ecr repo or not"
}

variable "manage_repo_permissions" {
  type        = bool
  description = "wheter to manage the repo permissions or not"
}

variable "sid" {
  type        = string
  description = "wheter to manage the repo permissions or not"
}
variable "principals_arn" {
  type        = list(any)
  description = "wheter to manage the repo permissions or not"
}
variable "principals_actions" {
  type        = list(any)
  description = "wheter to manage the repo permissions or not"
}
