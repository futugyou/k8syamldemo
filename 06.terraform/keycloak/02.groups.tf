resource "keycloak_group" "group" {
  realm_id = "master"
  name     = "foo"
}

resource "keycloak_user_groups" "user_groups" {
  realm_id   = "master"
  user_id    = keycloak_user.user.id
  exhaustive = false

  group_ids = [
    keycloak_group.group.id
  ]
}
