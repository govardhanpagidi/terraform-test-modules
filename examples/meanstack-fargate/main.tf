
module "aws-fargate" {
  source = "govardhanpagidi/modules/test//modules/aws-fargate-integration"

  public_key = "<public_key>"
  private_key = "<private_key>"
  atlas_org_id = "<atlas_org_id>"


  region = "US_EAST_1"
  server_service_ecr_image_uri = ""
  availability_zones = ["us-east-1a" , "us-east-1b"]
  environmentId = "development"
  client_service_ecr_image_uri = ""
  mongodb_connection_string = ""

  vpc-id = ""
  subnet-id1 = ""
  subnet-id2 = ""
  securitygroup-id = ""
}