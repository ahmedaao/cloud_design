<details>  
  <summary><strong>Table of Contents</strong></summary>  
  
  - [Introduction](#introduction)
  - [Google Cloud CLI](#google-cloud-cli)
  - [Terraform](#terraform)
</details>



# Introduction
The completion of this project requires the prior installation of various tools. In the following sections of this document, you will find the different tools installed and their associated installation commands.  



# Google Cloud CLI
```
sudo apt-get install apt-transport-https ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli
gcloud init
gcloud auth application-default login
```  



# Terraform
**Install Terraform**  
```
sudo apt update && sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```  

****  