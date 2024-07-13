terraform {
  required_version = "=1.8.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "iam" {
  source   = "./modules/iam"
  app_name = var.app_name
}

module "cloudwatch" {
  source                         = "./modules/cloudwatch"
  config_rule_s3_bucket_tag_name = module.config.config_rule_s3_bucket_tag_name
  sns_topic_arn                  = module.sns.sns_topic_arn
}

module "s3" {
  source   = "./modules/s3"
  app_name = var.app_name
}

module "lambda" {
  source                  = "./modules/lambda"
  app_name                = var.app_name
  lambda_function_name    = var.lambda_function_name
  iam_role_arn_for_lambda = module.iam.iam_role_arn_for_lambda
}

module "config" {
  source                  = "./modules/config"
  iam_role_arn_for_config = module.iam.iam_role_arn_for_config
  s3_bucket_id            = module.s3.s3_bucket_id
  lambda_function_arn     = module.lambda.lambda_function_arn
}

module "sns" {
  source   = "./modules/sns"
  app_name = var.app_name
}


