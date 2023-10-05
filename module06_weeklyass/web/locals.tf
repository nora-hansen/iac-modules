locals {
    workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
    rg_name = "${var.rg_name}-${local.workspaces_suffix}"

    common_tags = {
        owner = var.owner
        billing = var.billing
        env = terraform.workspace
    }
}
