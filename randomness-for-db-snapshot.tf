resource "random_string" "db-snapshot-randomness" {
  length  = 3
  special = false
  upper   = false
}
