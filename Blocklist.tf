provider "azurerm" {
  # Your Azure provider configuration...
}

resource "azurerm_graph_service_principal" "example" {
  display_name = "terraform-graph"
}

resource "azurerm_graph_service_principal_password" "example" {
  service_principal_id = azurerm_graph_service_principal.example.object_id
  end_date             = "2023-01-01T01:02:03Z"
}

resource "azurerm_graph_user_force_password_change" "example" {
  user_principal_name = "user@yourdomain.com"
  email_addresses_to_block = ["blocked@otherdomain.com"]
  service_principal_id = azurerm_graph_service_principal.example.application_id
  service_principal_secret = azurerm_graph_service_principal_password.example.value
}