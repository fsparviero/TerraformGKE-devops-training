resource "kubernetes_service" "app_service" {
  metadata {
    namespace = var.namespace
    name      = var.app
  }

  spec {
    type = var.lb
    selector = {
      app = var.app
    }

    port {
      port        = var.port
      target_port = var.targetPort
    }
  }

  selector = {
    app = var.myapp
  }
}
