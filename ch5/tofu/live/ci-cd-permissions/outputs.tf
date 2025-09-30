output "lambda_test_role_arn" {
  description = "The ARN of the IAM role for testing"
  value       = arn:aws:iam::198321609771:role/lambda-sample-tests
}

output "lambda_deploy_plan_role_arn" {
  description = "The ARN of the IAM role for plan"
  value       = arn:aws:iam::198321609771:role/lambda-sample-plan
}

output "lambda_deploy_apply_role_arn" {
  description = "The ARN of the IAM role for apply"
  value       = arn:aws:iam::198321609771:role/lambda-sample-apply
}
