terraform {
  required_version = ">= 1.0, < 2.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 8.0"
    }
  }
}

provider "oci" {
  config_file_profile = var.oci_profile
  region              = var.region
}

module "state_bucket" {
  source = "../"

  compartment_id = var.compartment_id
  name           = var.bucket_name
  freeform_tags  = var.freeform_tags
}
