resource "azurerm_key_vault" "saranshkeyvault" {
  name                = "saranshtestkeyvault"
  location            = data.azurerm_resource_group.sandbox.location
  resource_group_name = data.azurerm_resource_group.sandbox.name
  tenant_id           = data.azurerm_client_config.current.tenant_id


  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
