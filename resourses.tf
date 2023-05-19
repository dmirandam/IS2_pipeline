resource "aws_s3_bucket" "codepipeline_artifact_bucket" {
  bucket = var.codepipeline_artifact_bucket_name
  acl    = "private"
}

resource "aws_s3_bucket" "codepipeline_bucket" {
    bucket = var.bucket_name
    policy = <<POLICY
    {"version":"2012-10-17",
    "statement":[
        {
            "Sid":       "AddPerm"
            "effect":    "Allow",
            "principal": "*",
            "action":    "s3:GetObject",
            "resource":  "arn:aws:s3:::${var.bucket_name}/*"
        }
    ]
}
POLICY  
}
  
resource "aws_s3_bucket_website_configuration" "webfront" {

    bucket = aws_s3_bucket.codepipeline_bucket.id
    index_document {
        suffix = index.html
    }
    error_document{
        key = index.html
    }
    routing_rule {
        condition {
            key_prefix_equals = "/"
        }
    redirect {
      replace_key_prefix_with = "/index.html"
    }
  }
}

resource "aws_codecommit_repository" "example_repo" {
    repository_name = var.reponame
  
}

resource "aws_iam_role" "codepipeline_role" {
    name = var.codepipleine_role_name
    assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": [
                    "codepipeline.amazonaws.com"
                ]
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
POLICY
}

resource "aws_iam_role" "codebuild_role" {
    name = var.codebuild_role_name
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Sid": ""
            "Principal": {
                "Service": "codebuild.amazonaws.com"
            },
            "Action": "sts:AssumeRole",
            
        }
    ]
  
}
EOF
}