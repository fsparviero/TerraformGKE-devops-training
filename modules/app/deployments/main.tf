
resource "kubernetes_deployment" "app_deployment" {
  metadata {
    name      = var.name
    namespace = var.namespace
    
    labels = {
      app = var.myapp
      env = var.environment
    }
  }

  spec {
    replicas = var.replica

    selector {
      match_labels = {
        app = var.myapp
      }
    }

    template {
      metadata {
        labels = {
          app = var.myapp
        }
      }

      spec {
        container {
          image = var.image
          name = var.myapp
          port{
             container_port = var.port
              }
	  
          
        }
      }
    }
  }
}
