provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}
locals {
  ip_address_list = [
    for ip in var.ip_address :
    {
      ip_address = ip
      comment    = "IP Address ${ip}"
    }
  ]

  cidr_block_list = [
    for cidr in var.cidr_block :
    {
      cidr_block = cidr
      comment    = "CIDR Block ${cidr}"
    }
  ]
}

# Project Resource
resource "mongodbatlas_project" "project" {
  name   = var.project_name
  org_id = var.atlas_org_id
}


# IP Access List  with IP Address
resource "mongodbatlas_project_ip_access_list" "ip" {
  for_each = {
    for index, ip in local.ip_address_list :
    ip.comment => ip
  }
  project_id =mongodbatlas_project.project.id
  ip_address = each.value.ip_address
  comment    = each.value.comment
}

# IP Access List  with CIDR Block
resource "mongodbatlas_project_ip_access_list" "cidr" {

  for_each = {
    for index, cidr in local.cidr_block_list :
    cidr.comment => cidr
  }
  project_id =mongodbatlas_project.project.id
  cidr_block = each.value.cidr_block
  comment    = each.value.comment
}

resource "mongodbatlas_advanced_cluster" "cluster" {
  project_id   = mongodbatlas_project.project.id
  name                   = var.cluster_name
  cluster_type           = var.cluster_type

  replication_specs {
    num_shards = 1
    region_configs {
      electable_specs {
        node_count = 3
        instance_size = var.provider_instance_size_name
      }
      provider_name         = var.provider_name
      backing_provider_name = var.backing_provider_name
      region_name           = var.region
      priority              = var.priority
    }
  }

  tags {
    key   = var.tag_name
    value = var.tag_value
  }
}

# DATABASE USER
resource "mongodbatlas_database_user" "user" {
  count             = length(var.db_users)
  username          = var.db_users[count.index]
  password          = var.db_passwords[count.index]
  project_id        = mongodbatlas_project.project.id
  auth_database_name = "admin"

  roles {
    role_name     = var.role_name
    database_name = var.database_names[count.index]
  }

  labels {
    key   = "Name"
    value = var.database_names[count.index]
  }

  scopes {
    name = mongodbatlas_advanced_cluster.cluster.name
    type = "CLUSTER"
  }
}

resource "mongodbatlas_privatelink_endpoint" "pe_east" {
  project_id    = mongodbatlas_project.project.id
  provider_name = var.provider_name
  region        = var.aws_region
}

resource "mongodbatlas_privatelink_endpoint_service" "pe_east_service" {
  project_id          = mongodbatlas_project.project.id
  private_link_id     = mongodbatlas_privatelink_endpoint.pe_east.private_link_id
  endpoint_service_id = aws_vpc_endpoint.vpce_east.id
  provider_name       = var.provider_name
}

