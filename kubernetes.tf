provider "aws" {
  region = "us-east-1"  # Cambia a la región deseada
}

module "eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.2.0"

  cluster_name    = "my-cluster"  # Reemplaza con el nombre deseado para el clúster
  cluster_version = "1.21"

  vpc_id     = "vpc-12345678"    # Reemplaza con el ID de tu VPC existente
  subnet_ids = ["subnet-abcdef", "subnet-ghijkl"]  # Reemplaza con los IDs de tus subnets

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      instance_type    = "t3.medium"  # Configura según tus necesidades
    }
  }
}

resource "kubectl_deployment" "bff_deployment" {
  metadata {
    name = "bff-service"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "bff"
      }
    }

    template {
      metadata {
        labels = {
          app = "bff"
        }
      }

      spec {
        container {
          image = "mi-usuario/bff:latest"  # Reemplaza con tu imagen Docker del BFF
          name  = "bff"
        }
      }
    }
  }
}

resource "kubectl_service" "bff_service" {
  metadata {
    name = "bff-service"
  }

  spec {
    selector = {
      app = "bff"
    }

    port {
      port        = 80
      target_port = 3000  # Puerto donde el BFF escucha
    }
  }
}

# Recursos similares para el backend
