

module "aws_ecr" {
  source = "../"

  for_each = var.repositories

  region                  = var.region
  env                     = var.env
  project                 = var.project
  tags                    = var.tags
  create_ecr_repo         = var.create_ecr_repo
  repo_name               = each.value.repo_name
  scan_images_on_push     = each.value.scan_images_on_push
  image_tag_mutability    = each.value.image_tag_mutability
  encryption_type         = each.value.encryption_type
  kms_key                 = each.value.kms_key
  sid                     = each.value.sid
  principals_arn          = each.value.principals_arn
  principals_actions      = each.value.principals_actions
  manage_repo_permissions = each.value.manage_repo_permissions

}
