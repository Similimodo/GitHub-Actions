resource "aws_codebuild_project" "build_project" {
  name          = "test-project"
  description   = "test_codebuild_project"
  build_timeout = 5
  service_role  = aws_iam_role.codebuild.arn # Assuming aws_iam_role.codebuild is defined elsewhere

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
    type     = "GITHUB"
    location = "https://github.com/Similimodo/similimodo-terraform-webserver.git" # Your GitHub repo's HTTPS clone URL

    # No 'auth' block needed for public repos.
    # If it's a private repo, you'd use CodeStar Connections as discussed earlier.
    buildspec                 = "buildspec.yml"
    git_clone_depth           = 1
    report_build_status       = true
  }

  source_version = "main" # The default branch
}

# --- NEW RESOURCE: aws_codebuild_webhook ---
# This resource creates and manages the webhook for the CodeBuild project.
resource "aws_codebuild_webhook" "build_webhook" {
  project_name = aws_codebuild_project.build_project.name # Link to your CodeBuild project
  
  # Optional: Configuration for which events trigger the build
  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH,PULL_REQUEST_CREATED,PULL_REQUEST_UPDATED"
    }
    # Optional: filter by branch
    # filter {
    #   type    = "HEAD_REF"
    #   pattern = "^refs/heads/main$" # Trigger only for the 'main' branch
    # }
  }
}

# --- REMINDER: IAM Role and Policy (Assuming they are defined) ---
# Your aws_iam_role.codebuild and its policies would be defined here or in another file
# to grant CodeBuild permissions to access CloudWatch Logs, S3, Secrets Manager (if used), etc.
# For CodeBuild to use webhooks, its service role also needs permissions to create/manage webhooks
# (e.g., codebuild:CreateWebhook, codebuild:DeleteWebhook, codebuild:RegisterWebhookWithThirdPartySource, etc.)
# However, the `aws_codebuild_webhook` resource itself often handles the necessary API calls with AWS,
# so the CodeBuild project's role usually only needs basic CodeBuild permissions.


# --- IAM Role for CodeBuild ---
# This block allows the CodeBuild service to assume this role when it runs a build.
resource "aws_iam_role" "codebuild" {
  name               = "BuildProjectRole" # Ensure this name is unique within your AWS account
  assume_role_policy = data.aws_iam_policy_document.assume_role_for_codebuild.json

  tags = {
    Name = "BuildProjectRole"
    Project = "CICD" # Add relevant tags
  }
}

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

# --- IAM Policy for CodeBuild Role ---
# This policy grants the actual permissions the CodeBuild role needs to *do things* in AWS.
data "aws_iam_policy_document" "codebuild_permissions_document" {
  # 1. Permissions for CloudWatch Logs (essential for CodeBuild)
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    # Restrict to specific log groups if possible, but '*' for initial setup is common.
    # Note: Use the project name for the log group resource
    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${aws_codebuild_project.build_project.name}",
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${aws_codebuild_project.build_project.name}:log-stream:*"
    ]
  }

  # 2. Permissions for other AWS services (e.g., S3 for build artifacts, state files, etc.)
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket",
      # Add other S3 actions if CodeBuild needs to read/write build artifacts
      # to an S3 bucket used by CodePipeline or for caching.
      # You might also need: "s3:GetBucketAcl", "s3:GetBucketLocation"
      "ec2:*",          # If CodeBuild interacts with EC2, be more specific if possible
      "dynamodb:*",     # If CodeBuild touches DynamoDB (e.g., for state locking)
      "kms:*",          # If CodeBuild interacts with KMS encrypted resources
    ]
    resources = ["*"] # Best practice: restrict to specific ARNs when possible
  }

  # 3. Permissions to read the GitHub PAT from Secrets Manager (if you chose that option)
  # Uncomment and specify if you are using this method.
  /*
  statement {
    effect = "Allow"
    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
    ]
    # Replace with the actual ARN of your Secrets Manager secret
    resources = [aws_secretsmanager_secret.github_pat.arn]
  }
  */

  # 4. Permissions for CodeStar Connections (if you choose this more secure option)
  # Uncomment and specify if you are using this method.
  /*
  statement {
    effect = "Allow"
    actions = [
      "codestar-connections:UseConnection"
    ]
    # Replace with the actual ARN of your CodeStar Connection to GitHub
    resources = [
      "arn:aws:codestar-connections:${data.aws_partition.current.region}:${data.aws_caller_identity.current.account_id}:connection/your-github-connection-id"
    ]
  }
  */
}

resource "aws_iam_role_policy" "codebuild_policy_attachment" {
  role   = aws_iam_role.codebuild.name
  policy = data.aws_iam_policy_document.codebuild_permissions_document.json
}

# --- Optional Data Sources for ARN construction (if you didn't have them) ---
data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}