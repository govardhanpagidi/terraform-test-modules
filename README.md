# terraform-mongodbatlas-modules for quick starts
Terraform MongoDB Atlas Modules: Deploy, update, and manage MongoDB Atlas infrastructure as code through HashiCorp Terraform 

## quick starts:
### 1. Atlas basic
### 2. mongodb-sagemaker-integration
### 3. mongodb-meanstackapps-with-fargate


## How to deploy to [terraform registry](https://registry.terraform.io/browse/modules)

### STEP 1: 
#### To bump the version add the git tag and push it to the repo
```
  git tag <version> <7 digit githash>
  git push origin <version>
```
example:
```
  git tag v0.0.2 baaeafb
  git push origin v0.0.2
```

### STEP 2: 
This repo is already published into registry with [terraform-test-modules](https://registry.terraform.io/modules/govardhanpagidi/modules/test/latest)
The changes will automatically reflect once you push the changes to master/main branch.

If you want to publish with your own github account and use, you can create/clone to your own repo and publish to [terraform registry](https://registry.terraform.io/browse/modules).

