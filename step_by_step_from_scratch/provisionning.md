<details>  
  <summary><strong>Table of Contents</strong></summary>  
  
  - [Introduction](#introduction)
  - [Imperative VS. Declarative](#imperative-vs-declarative)
  - [VMs](#vms)
    - [Gcloud](#gcloud)
    - [Terraform](#terraform)
</details>



# Introduction
In this project, we will need to use many different tools (VMs, load balancer, orchestrator, etc…). All these tools will be provisioned automatically using either gcloud (imperative) or Terraform (declarative). In the following sections of this document, we will find provisioning using both gcloud and Terraform.  



# Imperative VS. Declarative
Side-by-side timeline for provisionning 4 VMs:  

**First Run**  
| Step   | Imperative (gcloud) | Declarative (Terraform) |
|--------|---------------------|-------------------------|
| Action | Create 4 VMs        | Create 4 VMs            |
| Result | 4 VMs are created	 | 4 VMs are created       |

**Second Run**  
| Step     | Imperative (gcloud)                                       | Declarative (Terraform)                          |
|----------|-----------------------------------------------------------|--------------------------------------------------|
| Action   | Run the same than first run                               | Run the same than first run                      |
| Behavior | Fails (already exists) or duplicates if you changes names | Terraform compares desired state with real state |
| Result   | Error or duplicate VMs (not idempotent)               	   | No changes applied (idempotent)                  |

Key takeaway:  
**Imperative** tools don’t remember what’s already there, you must handle logic yourself.  
**Declarative** tools (Terraform) manage state, safe to re-run, they only act when needed.  



# VMs
For this project, we create four VMs named **control-plane**, **node-1**, **node-2** & **node-3** from our local CLI  
Into your local shell CLI, enter the following commands:  

## Gcloud
```
# Set the project
gcloud config set project streetcoder-aaitouaz

# Common variables
ZONE=europe-west1-b
MACHINE_TYPE=e2-micro
IMAGE_FAMILY=debian-12
IMAGE_PROJECT=debian-cloud
DISK_SIZE=10GB
DISK_TYPE=pd-balanced

# Create the "control-plane" VM
gcloud compute instances create control-plane \
  --zone=$ZONE \
  --machine-type=$MACHINE_TYPE \
  --image-family=$IMAGE_FAMILY \
  --image-project=$IMAGE_PROJECT \
  --boot-disk-size=$DISK_SIZE \
  --boot-disk-type=$DISK_TYPE \
  --tags=control-plane,ssh

# Create the "worker-1" VM
gcloud compute instances create worker-1 \
  --zone=$ZONE \
  --machine-type=$MACHINE_TYPE \
  --image-family=$IMAGE_FAMILY \
  --image-project=$IMAGE_PROJECT \
  --boot-disk-size=$DISK_SIZE \
  --boot-disk-type=$DISK_TYPE \
  --tags=worker-1,http-3000

# Create the "worker-2" VM
gcloud compute instances create worker-2 \
  --zone=$ZONE \
  --machine-type=$MACHINE_TYPE \
  --image-family=$IMAGE_FAMILY \
  --image-project=$IMAGE_PROJECT \
  --boot-disk-size=$DISK_SIZE \
  --boot-disk-type=$DISK_TYPE

# Create the "worker-3" VM
gcloud compute instances create worker-3 \
  --zone=$ZONE \
  --machine-type=$MACHINE_TYPE \
  --image-family=$IMAGE_FAMILY \
  --image-project=$IMAGE_PROJECT \
  --boot-disk-size=$DISK_SIZE \
  --boot-disk-type=$DISK_TYPE

# Create firewall rule for SSH access to control-plane
gcloud compute firewall-rules create allow-control-plane-ssh \
  --allow=tcp:22 \
  --target-tags=control-plane \
  --description="Allow SSH access to control-plane from the Internet"

# Create firewall rule for port 3000 access to worker-1
gcloud compute firewall-rules create allow-worker1-3000 \
  --allow=tcp:3000 \
  --target-tags=worker-1 \
  --description="Allow TCP port 3000 access to worker-1 from the Internet"

```  
To customize even more VMs. Check this official documentation: https://cloud.google.com/sdk/gcloud/reference/compute/instances/create  


## Terraform
