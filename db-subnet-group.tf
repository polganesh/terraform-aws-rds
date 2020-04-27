resource "aws_db_subnet_group" "main" {
  name       = "dbsgrp-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.seq_id}"
  subnet_ids = var.db_subnet_group_ids
  tags = merge(
    var.common_tags,
    var.tag_for_db_subnet_group,
    {
      Name        = "dbsgrp-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.seq_id}"
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