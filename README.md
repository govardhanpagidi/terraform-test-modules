# terraform-mongodbatlas-modules for quick starts
Terraform MongoDB Atlas Modules: Deploy, update, and manage MongoDB Atlas infrastructure as code through HashiCorp Terraform 

## quick starts:
  * Atlas basic
  * mongodb-sagemaker-integration
  * mongodb-meanstackapps-with-fargate


## How to deploy to [terraform registry](https://registry.terraform.io/browse/modules)


Only for the very first time, we sholud publish the modules to [terraform registry](https://registry.terraform.io/browse/modules) by logging in [terraform registry](https://registry.terraform.io/) using github account.
  * login with github account
  * use publish > module option
  * select the repository
  * publish

## How to update the modules in terraform registry

Make sure all changes are updated to main branch.

#### Bump the version add the git tag and push it to the repo
```
  git tag <version> <7 digit githash>
  git push origin <version>
```
example:
```
  git tag v0.0.2 baaeafb
  git push origin v0.0.2
```

This repo is already published into registry with [terraform-test-modules](https://registry.terraform.io/modules/govardhanpagidi/modules/test/latest)
The changes will automatically reflect once you push the changes to master/main branch.


