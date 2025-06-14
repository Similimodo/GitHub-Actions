# --- Data Sources for current AWS Region and Account ID ---
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

# --- AWS CodeStar Connections Connection ---
# This resource creates the connection entry in AWS.
# CRITICAL: The actual authorization (OAuth handshake with GitHub) MUST be completed manually
# in the AWS Console (under CodePipeline -> Connections) AFTER 'terraform apply' creates this resource.
resource "aws_codestarconnections_connection" "github_connection" {
  name          = "my-codebuild-github-connection" # Unique name for your connection
  provider_type = "GitHub" # Specifies the third-party provider
}

# --- IAM Role for CodeBuild Project ---
resource "aws_iam_role" "codebuild" {
  name               = "BuildProjectRole-${var.aws_account_id}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_for_codebuild.json

  tags = {
    Project   = "WebServerCICD"
    ManagedBy = "Terraform"
  }
}

# --- IAM Policy Document for Assume Role ---
data "aws_iam_policy_document" "assume_role_for_codebuild" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# --- IAM Policy Document for CodeBuild Permissions ---
data "aws_iam_policy_document" "codebuild_permissions_document" {
  # Permissions for CloudWatch Logs
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${aws_codebuild_project.build_project.name}",
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${aws_codebuild_project.build_project.name}:log-stream:*"
    ]
  }

  # Permissions for S3
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
      "s3:ListBucket",
    ]
    resources = ["*"]
  }

  # Permissions for other AWS services
  statement {
    effect = "Allow"
    actions = [
      "ec2:Describe*",
      "dynamodb:*",
      "kms:*",
      "ssm:GetParameters"
    ]
    resources = ["*"]
  }

  # Permissions for the CodeBuild Webhook to interact with GitHub
  statement {
    effect = "Allow"
    actions = [
      "codebuild:CreateWebhook",
      "codebuild:DeleteWebhook",
      "codebuild:UpdateWebhook",
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild"
    ]
    resources = [aws_codebuild_project.build_project.arn]
  }

  # CRITICAL: Permission to use the CodeStar Connection
  statement {
    effect = "Allow"
    actions = [
      "codestar-connections:UseConnection"
    ]
    resources = [aws_codestarconnections_connection.github_connection.arn]
  }
}

# --- Attach the policy to the CodeBuild role ---
resource "aws_iam_role_policy" "codebuild_policy_attachment" {
  role   = aws_iam_role.codebuild.name
  policy = data.aws_iam_policy_document.codebuild_permissions_document.json
}

# --- AWS CodeBuild Project ---
resource "aws_codebuild_project" "build_project" {
  name          = "test-project"
  description   = "CodeBuild project for a webserver from GitHub via CodeStar Connection"
  build_timeout = 5
  service_role  = aws_iam_role.codebuild.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  source {
    # CRITICAL CHANGE: Use CODESTAR_SOURCE_CONNECTION type
    type     = "GITHUB"
    location = "https://github.com/Similimodo/similimodo-terraform-webserver.git" # Your GitHub repo URL
    buildspec           = "buildspec.yaml"
    git_clone_depth     = 1
    report_build_status = true
  }

  source_version = "main"

  tags = {
    Project   = "WebServerCICD"
    ManagedBy = "Terraform"
  }
}
