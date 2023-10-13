
output "project_id" {
  value = mongodbatlas_project.project.id
}

output "standard_srv" {
  value = mongodbatlas_advanced_cluster.cluster.connection_strings
}
