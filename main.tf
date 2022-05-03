#module "naming" {
#  source      = "./../../security/naming"
#  environment = var.env
#  project     = var.project
#}


resource "aws_ecr_repository" "name" {
  count                = var.create_ecr_repo ? 1 : 0
  name                 = var.repo_name
  image_tag_mutability = var.image_tag_mutability
  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.kms_key
  }
  image_scanning_configuration {
    scan_on_push = var.scan_images_on_push
  }

  tags = var.tags
}


resource "aws_ecr_repository_policy" "name" {
  count      = var.manage_repo_permissions ? 1 : 0
  #repository = aws_ecr_repository.name[0].name
  repository = var.repo_name
  policy = jsonencode({
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": var.sid, 
      "Effect": "Allow",
      "Principal": {
        "AWS": ["root"]
        "AWS": var.principals_arn
      },
      "Action": "${var.principals_actions}"
    }
  ]
})
}
