<details>  
  <summary><strong>Table of Contents</strong></summary>  
  
  - [Stack](#stack)
  - [Prerequisites](#prerequisites)
  - [Architecture](#architecture)
  - [Commands](#commands)
    - [Provisionning](#provisionning)
  - [Naming Convention](#naming-convention)
  - [Monitoring](#monitoring)
</details>  



# Stack
GCP VPC --> OK  
GCP Compute Engine --> OK  
GCP Cloud Identity  
GCP GKE (Google Kubernetes Engine)  
Docker  
Terraform --> OK  
Prometheus  
Grafana  



# Prerequisites
To see all the prerequisite steps in detail, it happens [here](step_by_step_from_scratch/prerequisites)  



# Architecture



# Commands
## Provisionning
| Command                                | Detail                                                                                          |
|----------------------------------------|-------------------------------------------------------------------------------------------------|
| `terraform init`                       | Initializes the working directory and checks that the required plugins are correctly installed. |
| `terraform validate`                   | Detect errors before applying commands plan & apply                                             |
| `terraform plan`                       | Shows which actions it will perform to reach the state described in the configuration file.     |
| `terraform apply`                      | The desired infrastructure is deployed.                                                         |
| `terraform fmt`                        | Automatically corrects the formatting                                                           |
| `terraform state list`                 | List all resources included inside the state file terraform.tfstate                             |
| `terraform state show <resource>`      | Displays the details of a specific resource in the state file                                   |
| `terraform state rm <resource>`        | Remove a specific resource from the state file without deleting it from the infrastructure      |
| `terraform refresh`                    | Synchronize the state with the actual infrastructure                                            |
| `terraform destroy`                    | The infrastructure is destroyed.                                                                |
| `terraform workspace list`             | List all workspaces                                                                             |
| `terraform workspace show`             | Display the name of the current workspace                                                       |
| `terraform workspace new <ws_name>`    | Create a new workspace named "ws_name"                                                          |
| `terraform workspace select <ws_name>` | Select & enable state configuration form "ws_name"                                              |
| `terraform workspace delete <ws_name>` | Delete workspace <ws_name>                                                                      |


##



# Monitoring



# Others
| description       | link                          |
|-------------------|-------------------------------|
| GCP documentation | https://cloud.google.com/docs |