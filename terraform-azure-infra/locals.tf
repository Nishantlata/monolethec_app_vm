locals {
  common_tags = {
    Environment = var.environment
    Project     = "terraform-azure-infra"
    ManagedBy   = "Nishant"
  }
}
