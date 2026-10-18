resource "oci_objectstorage_bucket" "this" {
  compartment_id        = var.compartment_id
  namespace             = data.oci_objectstorage_namespace.this.namespace
  name                  = var.name
  access_type           = "NoPublicAccess"
  storage_tier          = "Standard"
  versioning            = "Enabled"
  object_events_enabled = false
  auto_tiering          = "Disabled"
  freeform_tags         = var.freeform_tags

  lifecycle {
    prevent_destroy = true
  }
}
