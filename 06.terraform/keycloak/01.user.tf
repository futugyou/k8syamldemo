resource "keycloak_user" "user" {
  realm_id = "master"
  username = "testuser"
  email    = "testuser@hotmail.com"
  enabled  = true
  first_name = "Alice"
  last_name  = "Aliceberg"
  initial_password {
    value     = "some password"
    temporary = false
  }
}
