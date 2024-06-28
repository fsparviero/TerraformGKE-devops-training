terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.0" // Specify the version range you want to use
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.0" // Specify the version range you want to use
    }
  }
}

provider "google" {
  // Configuration options for the Google provider
}

provider "kubernetes" {
  // Configuration options for the Kubernetes provider
}



resource "google_container_cluster" "mycluster" {
  name                     = "my-gke-cluster"
  location                 = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 3


}

resource "google_container_node_pool" "my_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.mycluster.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

  }


}



resource "kubernetes_namespace" "preview" {
  metadata {
    annotations = {
      name = "preview"
    }

    labels = {
      mylabel = "preview"
    }

    name = "terraform-preview-namespace"
  }
}
resource "kubernetes_namespace" "staging" {
  metadata {
    annotations = {
      name = "staging"
    }

    labels = {
      mylabel = "staging"
    }

    name = "terraform-staging-namespace"
  }
}

resource "kubernetes_namespace" "production" {
  metadata {
    annotations = {
      name = "production"
    }

    labels = {
      mylabel = "production"
    }

    name = "terraform-production-namespace"
  }
}

module "preview_deployments" {
  source    = "./modules/app/deployments"
  namespace = kubernetes_namespace.preview.metadata[0].name
  # Add additional parameters as needed
}

module "staging_deployments" {
  source    = "./modules/app/deployments"
  namespace = kubernetes_namespace.staging.metadata[0].name
  # Add additional parameters as needed
}

module "production_deployments" {
  source    = "./modules/app/deployments"
  namespace = kubernetes_namespace.production.metadata[0].name
  # Add additional parameters as needed
}

module "preview_service" {
  source    = "./modules/app/service"
  namespace = kubernetes_namespace.preview.metadata[0].name
  # Add additional parameters as needed
}

module "staging_service" {
  source    = "./modules/app/service"
  namespace = kubernetes_namespace.staging.metadata[0].name
  # Add additional parameters as needed
}

module "production_service" {
  source    = "./modules/app/service"
  namespace = kubernetes_namespace.production.metadata[0].name
  # Add additional parameters as needed
}

