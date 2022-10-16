resource "keycloak_user" "user" {
  realm_id   = var.realm_id
  username   = var.username
  email      = var.email
  first_name = var.first_name
  last_name  = var.last_name
  
  enabled    = true

  initial_password {
    value     = "some password"
    temporary = false
  }

  attributes = {
    github_username   = var.github_username,
    department    = var.department,
  }
}
