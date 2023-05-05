# Configure the Active Directory provider
provider "active_directory" {
  host = "your-ad-hostname"
  username = "your-ad-username"
  password = "your-ad-password"
}

# Create a new user
resource "active_directory_user" "new_user" {
  name = "newuser"
  user_principal_name = "newuser@yourdomain.com"
  first_name = "New"
  last_name = "User"
  password = "password123"
  department = "IT"
  enabled = true
}

# Grant the new user basic permissions
resource "active_directory_user_permission" "basic_permissions" {
  user_principal_name = "${active_directory_user.new_user.user_principal_name}"
  permissions = [
    "read",
    "write",
    "execute",
  ]
  object_dn = "OU=your-ou,DC=yourdomain,DC=com"
}