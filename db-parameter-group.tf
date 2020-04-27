resource "aws_db_parameter_group" "main" {
  name        = "pgrp-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.seq_id}"
  description = var.db_param_grp_description
  family      = var.db_param_grp_family

  dynamic "parameter" {
    for_each = var.db_parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }

  tags = merge(
    var.common_tags,
    var.tag_for_db_param_grp,
    {
      family = var.db_param_grp_family
    },
    {
      Name        = "pgrp-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.seq_id}"
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
