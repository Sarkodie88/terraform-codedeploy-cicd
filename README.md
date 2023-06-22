# terraform-codedeploy-pipelines
This is a Terraform boilerplate for setting up a basic CI/CD deploying applications using codepipeline and ec2 instances. The purpose of this project is to provide a starting point for anyone looking to deploy applications on EC2 instances using AWS developer tools including CodeCommit, CodeBuild, CodeDeploy.

## Diagrammatic representation
![Alt text](/terraform-codedeploy-pipelines/ci-diagram.png?raw=true "Title")
<!-- ![plot](./terraform-codedeploy-pipelines/ci-diagram.png) -->

## Features
- CI/CD Pipeline [CodeCommit]
- Git Repository [CodePipeline]
- Build Project  [CodeBuild]
- CodeDeploy Application   [CodeDeploy]
- CodeDeploy Application Deployment group ie dev, uat, prod, etc [CodeDeploy]
- IAM roles     [IAM]
- EC2 instances [EC2]
- Etc
The configuration is designed to be easily customizable and extensible, allowing you to build on top of it to fit your specific needs.

## Prerequisites
- AWS Account
- Terraform installed
- AWS CLI


## Getting started

1. Clone the repository:
   ```sh
   git clone https://github.com/Sarkodie88/terraform-codedeploy-cicd.git
   ```
2. Initialize terraform
   ```sh
   terraform init
   ```
3. Edit the var_parameters.tfvars file with your desired values.

4.  Verification of the configuration
    ```sh
    terraform plan -var-file=var_parameters.tfvars
    ```
5. Deploy
    ```sh
    terraform apply -var-file=var_parameters.tfvars
    ```
6. Destroy
    ```sh
    terraform destroy -var-file=var_parameters.tfvars
    ```


## Contributing
If you'd like to contribute to this project, please fork the repository and make the desired changes. Then, submit a pull request for review.