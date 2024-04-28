variable "namespace" {
  description = "The namespace of the service"
  type = string
  default = "preview"
}

variable "app" {
  description = "The name of the application"
  type = string
  default = "myapp"
}
variable "myapp" {
  description = "The name of the application"
  type = string
  default = "myapp"
}

variable "lb" {
  description = "The type of load balancer"
  type = string
  default = "LoadBalancer"
}

variable "port" {
  description = "The port exposed by the service"
  type = string
  default = "80"
}

variable "targetPort" {
  description = "The port to forward traffic to"
  type = string
  default = "8000"
}
