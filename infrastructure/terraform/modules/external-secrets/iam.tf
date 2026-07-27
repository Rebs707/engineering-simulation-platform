locals {
  oidc_provider = replace(var.cluster_oidc_issuer_url, "https://", "")
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.cluster_oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider}:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider}:sub"
      values   = ["system:serviceaccount:${var.namespace}:${var.service_account_name}"]
    }
  }
}

resource "aws_iam_role" "external_secrets" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "external_secrets" {
  statement {
    sid    = "ReadSecretsManagerSecrets"
    effect = "Allow"
    actions = [
      "secretsmanager:DescribeSecret",
      "secretsmanager:GetSecretValue",
      "secretsmanager:ListSecretVersionIds"
    ]
    resources = var.secret_arns
  }

  statement {
    sid       = "DecryptSecrets"
    effect    = "Allow"
    actions   = ["kms:Decrypt"]
    resources = var.kms_key_arns
  }
}

resource "aws_iam_role_policy" "external_secrets" {
  name   = "external-secrets-access"
  role   = aws_iam_role.external_secrets.id
  policy = data.aws_iam_policy_document.external_secrets.json
}
