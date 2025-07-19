terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  cloud {
    organization = "TF_Cloud_Org_101"

    workspaces {
      name = "tf-gcp-with-ado"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.credentials_file
}

// Uncomment the following modules to create network and compute resources

# module "network" { // Network module to create VPC and subnets
#   source     = "./modules/network"
#   project_id = var.project_id
#   region     = var.region
# }

# module "compute" { // Compute module to create VM instances
#   source     = "./modules/compute"
#   project_id = var.project_id
#   region     = var.region
#   subnet     = module.network.subnet_name
# }

module "storage" {
  source     = "./modules/storage"
  project_id = var.project_id
}
