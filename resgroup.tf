resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "UK South"
}
