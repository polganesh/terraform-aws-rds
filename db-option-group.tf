resource "aws_db_option_group" "main" {
  name              = "optgrp-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.seq_id}"
  option_group_description = var.option_group_description
  engine_name              = var.db_option_group_engine_name
  major_engine_version     = var.db_option_group_major_engine_version

  dynamic "option" {
    for_each = var.options
    content {
      option_name                    = option.value.option_name
      port                           = lookup(option.value, "port", null)
      version                        = lookup(option.value, "version", null)
      db_security_group_memberships  = lookup(option.value, "db_security_group_memberships", null)
      vpc_security_group_memberships = lookup(option.value, "vpc_security_group_memberships", null)

      dynamic "option_settings" {
        for_each = lookup(option.value, "option_settings", [])
        content {
          name  = lookup(option_settings.value, "name", null)
          value = lookup(option_settings.value, "value", null)
        }
      }
    }
  }

  tags = merge(
    var.common_tags,
    var.tag_for_db_option_group,
    {
      EngineName         = var.db_option_group_engine_name
      MajorEngineVersion = var.db_option_group_major_engine_version
    },
    {
      Name        = "optgrp-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.seq_id}"
      RegionId    = var.region_id
      Environment = var.environment
      CostCentre  = var.cost_centre
      VersionId   = var.version_id # this is indication of version. for each change it is better to incr this value
      BuildDate   = var.build_date
      AppService  = var.app_service
      AppRole     = "database"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}
