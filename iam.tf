resource "aws_iam_user" "william_panebianco" {
  name = "williampanebianco"
}

resource "aws_iam_group" "administrators" {
  name = "Administrators"
}

resource "aws_iam_group_policy_attachment" "administrator_access" {
  group      = aws_iam_group.administrators.id
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_group_membership" "william_panebianco_groups" {
  groups = [aws_iam_group.administrators.id]
  user   = aws_iam_user.william_panebianco.id
}

module "secure_transport_policy_logs" {
  source      = "./modules/iam/secure-transport-policy"
  bucket_name = local.s3_bucket_logs_name
}
