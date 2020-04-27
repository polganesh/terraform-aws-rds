resource "aws_db_instance" "main" {
  count = local.is_mssql == false ? 1 : 0
  #--------------------------------------------
  # ---- db basic details  
  #rds dont allow - in its name hence not having -
  name                = "rds${var.region_id}${var.environment}${var.cost_centre}vpc${var.vpc_seq_id}${var.app_service}${var.seq_id}"
  identifier          = "rds${var.region_id}${var.environment}${var.cost_centre}vpc${var.vpc_seq_id}${var.app_service}${var.seq_id}"
  engine              = var.db_engine_name
  engine_version      = var.db_engine_version
  replicate_source_db = var.db_replicate_source_db

  #-----------------------------------------
  #--- Cost & Performance
  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage
  storage_type          = var.db_storage_type
  instance_class        = var.db_instance_class
  iops                  = var.db_iops
  # required for few licence rds which involve cost
  license_model = var.db_license_model

  #-----------------------------------------
  #--- security
  username                            = var.db_username
  password                            = var.db_password
  iam_database_authentication_enabled = var.db_iam_authentication_enabled
  port                                = var.db_port
  # Note that if you are creating a cross-region read replica this storage_encrypted
  # is ignored and you should instead declare kms_key_id with a valid ARN. 
  # The default is false if not specified.
  storage_encrypted      = var.db_storage_encrypted
  kms_key_id             = var.db_kms_key_id
  deletion_protection    = var.db_deletion_protection
  vpc_security_group_ids = var.db_vpc_security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.main.id

  #-----------------------------------------
  #----maintainability
  final_snapshot_identifier   = "snap${var.region_id}${var.environment}${var.cost_centre}vpc${var.vpc_seq_id}${var.app_service}${var.seq_id}${random_string.db-snapshot-randomness.result}"
  allow_major_version_upgrade = var.db_allow_major_version_upgrade
  apply_immediately           = var.db_apply_changes_immediately
  auto_minor_version_upgrade  = var.db_auto_minor_version_upgrade
  backup_retention_period     = var.db_backup_retention_period
  backup_window               = var.db_backup_window
  maintenance_window          = var.db_maintenance_window
  multi_az                    = var.db_is_multi_az
  copy_tags_to_snapshot       = var.db_is_copy_tags_to_snapshot
  parameter_group_name        = aws_db_parameter_group.main.id
  option_group_name           = aws_db_option_group.main.id
  #------------------------------------------
  #---cost and maintainability
  delete_automated_backups        = var.db_delete_automated_backups
  enabled_cloudwatch_logs_exports = var.db_enabled_cloudwatch_logs_exports
  monitoring_interval             = var.db_monitoring_interval
  monitoring_role_arn             = var.db_monitoring_role_arn

  tags = merge(
    var.common_tags,
    var.tag_for_rds,
    {
      Identifier               = "rds${var.region_id}${var.environment}${var.cost_centre}vpc${var.vpc_seq_id}${var.app_service}${var.seq_id}"
      EngineName               = var.db_engine_name
      EngineVersion            = var.db_engine_name
      AllowMajorVersionUpgrade = var.db_allow_major_version_upgrade
      ApplyChangesImmediately  = var.db_apply_changes_immediately
      AutoMinorVersionUpgrade  = var.db_auto_minor_version_upgrade
      BackupRetentionPeriod    = var.db_backup_retention_period
      BackupWindow             = var.db_backup_window
      MaintenanceWindow        = var.db_maintenance_window
      MonitoringInterval       = var.db_monitoring_interval
      MonitoringRoleArn        = var.db_monitoring_role_arn
    },
    {
      Name        = "rds${var.region_id}${var.environment}${var.cost_centre}vpc${var.vpc_seq_id}${var.app_service}${var.seq_id}"
      RegionId    = var.region_id
      Environment = var.environment
      CostCentre  = var.cost_centre
      VersionId   = var.version_id # this is indication of version. for each change it is better to incr this value
      BuildDate   = var.build_date
      AppService  = var.app_service
      AppRole     = "database"
    }
  )
}
