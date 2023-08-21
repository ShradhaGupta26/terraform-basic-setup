module "ec2-jenkins" {
  source               = "git::https://github.com/sumittiwari022/terraform-aws-jenkins.git"
  vpc_id               = data.aws_vpc.selected.id
  subnet_ids           = ["${data.aws_subnets.public.ids[0]}"]
  iam_instance_profile = module.iam_roles.iam_instance_profile_admin_name
  project_name_prefix = "${local.workspace.account_name}-${local.workspace.aws.region}-${local.workspace.project_name}"

}
