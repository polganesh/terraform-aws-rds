locals {
  is_mssql = element(split("-", var.db_engine_name), 0) == "sqlserver"
}