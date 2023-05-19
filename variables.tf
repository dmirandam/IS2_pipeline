variable "aws_region" {
    description = "AWS Region"
    type = string
    default = "us-east-2"
    nullable = false
    sensitive = false
}
 
variable "bucket_name" {
    description = "Name of the S3 bucket"
    type = string
    default = "PruebasIS2"
    nullable = false
    sensitive = false
}
  
variable "codepipeline_artifact_bucket_name" {
    description = "Name of the S3 bucket for CodePipeline artifacts"
    type = string
    default = "ARTpruebasIS2"
    nullable = false
    sensitive = false
}
  
variable "reponame" {
    description = "Name of the repository"
    type = string
    default = "PruebasIS2_repo"
    nullable = false
    sensitive = false
}

variable "codebuild_role_name" {
    description = "Name of the CodeBuild role"
    type = string
    default = "PruebasIS2_codebuild_role"
    nullable = false
    sensitive = false
}

variable "codepipleine_role_name" {
    description = "Name of the CodePipeline role"
    type = string
    default = "PruebasIS2_codepipeline_role"
    nullable = false
    sensitive = false
}
  

variable "default_vpc_id" {
    description = "ID of the default VPC"
    type = string
    default = "vpc-0beb2686636948d61"
    nullable = false
    sensitive = false
}


