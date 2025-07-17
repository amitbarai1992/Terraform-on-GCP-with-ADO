terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  backend "remote" {
    organization = "TF_Cloud_Org_101"

    workspaces {
      name = "tf-gcp-with-ado"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source     = "./modules/network"
  project_id = var.project_id
  region     = var.region
}

module "compute" {
  source     = "./modules/compute"
  project_id = var.project_id
  region     = var.region
  subnet     = module.network.subnet_name
}

module "storage" {
  source     = "./modules/storage"
  project_id = var.project_id
}
