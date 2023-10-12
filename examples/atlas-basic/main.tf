
provider "aws" {
    region     = "us-east-1"
    profile = "dev"
}

module "atlas-basic"  {
  source  = "../../modules/atlas-basic"

  public_key = "<public_key>"
  private_key = "<private_key>"
  atlas_org_id = "<atlas_org_id>"

  project_name = "test-modules-project-1"
  db_users = ["user1","user2"]
  db_passwords = ["Passw0rd1","Passw0rd1"]
  database_names = ["test-db1","test-db2"]
  region = "US_EAST_1"

  aws_vpc_cidr_block = "1.0.0.0/16"
  aws_vpc_egress = "0.0.0.0/0"
  aws_vpc_ingress = "0.0.0.0/0"
  aws_subnet_cidr_block1 = "1.0.1.0/24"
  aws_subnet_cidr_block2 = "1.0.2.0/24"

  cidr_block = ["10.1.0.0/16","12.2.0.0/16"]
  ip_address = ["208.169.90.207","63.167.210.250"]

}