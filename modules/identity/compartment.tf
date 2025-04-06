resource "oci_identity_compartment" "kubernetes_compartment" {
    #Required
    name = var.compartment_name
    description = "Dedicated to kubernetes clusters"
    enable_delete = true

    #Optional
    freeform_tags = {"Department"= "Devops"}
}