output "cf_id" {
  value       = aws_cloudfront_distribution.default[*].id
  description = "IDs of AWS CloudFront distributions"
}

output "cf_arn" {
  value       = aws_cloudfront_distribution.default[*].arn
  description = "ARNs of AWS CloudFront distributions"
}

output "cf_status" {
  value       = aws_cloudfront_distribution.default[*].status
  description = "Current statuses of the distributions"
}

output "cf_domain_name" {
  value       = aws_cloudfront_distribution.default[*].domain_name
  description = "Domain names corresponding to the distributions"
}

output "cf_etag" {
  value       = aws_cloudfront_distribution.default[*].etag
  description = "Current versions of the distributions' information"
}

output "cf_hosted_zone_id" {
  value       = aws_cloudfront_distribution.default[*].hosted_zone_id
  description = "CloudFront Route 53 zone IDs"
}

output "cf_identity_iam_arn" {
  value       = try(aws_cloudfront_origin_access_identity.default[0].iam_arn, "")
  description = "CloudFront Origin Access Identity IAM ARN"
}

output "cf_access_control_id" {
  value       = try(aws_cloudfront_origin_access_control.default[0].id, "")
  description = "CloudFront Origin Access Control ID"
}

output "cf_origin_groups" {
  value       = try(flatten(aws_cloudfront_distribution.default[*].origin_group), [])
  description = "List of Origin Groups in the CloudFront distribution."
}

output "cf_primary_origin_id" {
  value       = local.origin_id
  description = "The ID of the origin created by this module."
}

output "cf_origin_ids" {
  value       = try(flatten(aws_cloudfront_distribution.default[*].origin[*].origin_id), [])
  description = "List of all Origin IDs across all CloudFront distributions."
}

output "cf_s3_canonical_user_id" {
  value       = try(aws_cloudfront_origin_access_identity.default[0].s3_canonical_user_id, "")
  description = "Canonical user ID for CloudFront Origin Access Identity"
}

output "s3_bucket" {
  value       = local.bucket
  description = "Name of origin S3 bucket"
}

output "s3_bucket_domain_name" {
  value       = local.bucket_domain_name
  description = "Domain of origin S3 bucket"
}

output "s3_bucket_arn" {
  value       = local.origin_bucket.arn
  description = "ARN of origin S3 bucket"
}

output "s3_bucket_policy" {
  value       = join("", aws_s3_bucket_policy.default[*].policy)
  description = "Final computed S3 bucket policy"
}

output "logs" {
  value       = module.logs
  description = "Log bucket resource"
}

output "aliases" {
  value       = var.aliases
  description = "Aliases of the CloudFront distribution."
}
