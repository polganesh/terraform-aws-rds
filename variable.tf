variable "region_id" {
  default = "euw1"
}
variable "region" {
  description = "region in which resource will be get created."
  default     = "eu-west-1"
}

variable "environment" {
  description = "indicates name of our environment. possible values dev,cit,sit,uat,pprod,prod,n"
  default     = "dev"
}

variable "cost_centre" {
  description = "A part of an organization to which costs may be charged.e.g. finance/it/hr/wholesale/retail/investment etc..."
  default     = "na"
}

variable "seq_id" {
  default = "001"
}

variable "version_id" {
  description = "version of this component.everytime when we are updating this component we need to increment it."
  default     = "1"
}

variable "build_date" {
  description = "date on which this component built/modified. format ddmmyyyy e.g. 27122017"
  default     = ""
}

variable "vpc_seq_id"{
  default="001"
}

variable "common_tags" {
  type    = map
  default = {}
}

variable "tag_for_db_subnet_group" {
  type    = map
  default = {}
}

variable "tag_for_db_param_grp" {
  type    = map
  default = {}
}

variable "tag_for_rds" {
  type    = map
  default = {}
}

variable "tag_for_db_option_group" {
  type    = map
  default = {}
}



variable "app_service" {
  default = ""
}

variable "vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed."
  type        = string
  default     = null
}

variable "db_engine_version" {
  description = "The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10) and this attribute will ignore differences in the patch version automatically (e.g. 5.7.17). For supported values, see the EngineVersion parameter in API action CreateDBInstance. Note that for Amazon Aurora instances the engine version must match the DB cluster's engine version"
  type        = string
  default     = ""
}

variable "db_engine_name" {
  description = "Required unless a snapshot_identifier or replicate_source_db is provided. The database engine to use. For supported values, see the Engine parameter in API action CreateDBInstance. Note that for Amazon Aurora instances the engine must match the DB cluster's engine'. For information on the difference between the available Aurora MySQL engines see Comparison between Aurora MySQL 1 and Aurora MySQL 2 in the Amazon RDS User Guide."
  type        = string
  default     = ""
}

variable "db_allocated_storage" {
  description = "The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs"
  default     = 5
}

variable "db_max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling."
  default     = 0
}

variable "db_storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD). The default is io1 if iops is specified, gp2 if not."
  default     = "gp2"
}

variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  default     = "db.t2.micro"
}

variable "db_username" {
  description = "Username for the master DB user."
  default     = ""
}

variable "db_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  default     = ""
}

variable "db_deletion_protection" {
  default     = "false"
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. The default is false."
}

variable "db_allow_major_version_upgrade" {
  default     = "false"
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
}

variable "db_apply_changes_immediately" {
  default     = "false"
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. "
}

variable "db_auto_minor_version_upgrade" {
  default     = "true"
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true. "
}

variable "db_backup_retention_period" {
  default     = 0
  description = "The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica. "
}

variable "db_backup_window" {
  default     = ""
  description = "The daily time range in UTC during which automated backups are created if they are enabled. Example: 09:46-10:16. Must not overlap with maintenance_window"
}

variable "db_maintenance_window" {
  default     = ""
  description = "The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi. Eg: Mon:00:00-Mon:03:00. See RDS Maintenance Window docs for more information"
}

variable "db_enabled_cloudwatch_logs_exports" {
  default     = []
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values depending on engine: agent MSSQL, alert, audit, error, general, listener, slowquery, trace, postgresql PostgreSQL, upgrade PostgreSQL."
}

variable "db_monitoring_interval" {
  default     = 0
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60"
}

variable "db_monitoring_role_arn" {
  default    = ""
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs"
}

variable "db_is_copy_tags_to_snapshot" {
  default     = "false"
  description = " Copy all Instance tags to snapshots. Default is false."
}

variable "db_is_multi_az" {
  default     = "false"
  description = "Specifies if the RDS instance is multi-AZ"
}

variable "db_iops" {
  default     = 0
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of  io1"
}

variable "db_port" {
  default     = 0
  description = "The port on which the DB accepts connections."
}

variable "db_delete_automated_backups" {
  default     = true
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted. Default is true."
}

variable "db_storage_encrypted" {
  default     = false
  description = "Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms_key_id with a valid ARN. The default is false if not specified."
}

variable "db_kms_key_id" {
  default     = ""
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN"
}

variable "db_license_model" {
  default     = ""
  description = "required for oracle db"
}

variable "db_replicate_source_db" {
  default     = ""
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate. Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms_key_id."
}

variable "db_iam_authentication_enabled" {
  default     = false
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
}

variable "db_vpc_security_group_ids" {
  default     = []
  description = "List of VPC security groups to associate."
}

variable "db_param_grp_description" {
  default = "Managed by Terraform"
}

variable "db_param_grp_family" {
  default     = ""
  description = "The family of the DB parameter group"
}

variable "db_parameters" {
  type        = list(map(any))
  default     = []
  description = "A list of DB parameters to apply. Note that parameters may differ from a family to an other. "
}

variable "db_subnet_group_ids" {
  default     = []
  description = "A list of VPC subnet IDs"
}

variable "option_group_description" {
  default = "Managed By Terraform"
}

variable "db_option_group_engine_name" {
  default = ""
}

variable "db_option_group_major_engine_version" {
  default = ""
}

variable "options" {
  type    = list(map(any))
  default = []
}




















