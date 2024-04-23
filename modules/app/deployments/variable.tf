variable "name" {
  description = "The name of the deployment"
  type = string
  default = "myapp"
}

variable "namespace" {
  description = "The namespace of the deployment"
  type = string
  default = "preview"
}

variable "myapp" {
  description = "The label for the application"
  type = string
  default = "myapp"
}

variable "environment" {
  description = "The environment label"
  type = string
  default = "preview"
}

variable "replica" {
  description = "Number of replicas for the deployment"
  type = string
  default = "1"
}

variable "image" {
  description = "The Docker image for the container"
  type = string
  default = "nginx"
}

variable "port" {
  description = "The port to expose on the container"
  type = string
  default = "80"

}
