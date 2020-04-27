

example 

 ` ` `
module postgres-rds {
  source = "../../../../../terraform-aws-rds"
  #----------------------------------------------------------------------------
  #--- Basic Information for DB
  #----------------------------------------------------------------------------
  db_engine_name="postgres"
  #-- TODO higher versions available
  db_engine_version="10.6"
  #Postgres 10 onwards AWS support postgres10,postgres11....
  db_param_grp_family="postgres10"
  db_option_group_engine_name="postgres"
  db_option_group_major_engine_version="10"
  #----------------------------------------------------------------------------
  #--- Cost & Performance
  #----------------------------------------------------------------------------
  db_allocated_storage=100  # default is 5 Gb
  db_max_allocated_storage=200 # it can do vertical scaling till 200 Gb 
  db_storage_type="gp2" # default is gp2  
  db_instance_class="db.t2.micro"
  #----------------------------------------------------------------------------
  #----- Security
  #----------------------------------------------------------------------------
  db_username="myusername"
  #--- it can be define as environmental variable or can be define as secret 
  #in CI-CD tool
  db_password="strongpassword" 
  db_port=5432
  db_storage_encrypted=false
  db_vpc_security_group_ids=[sg-list
    ]
  db_subnet_group_ids=subnet-group-ids
  #----------------------------------------------------------------------------
  #----- maintainability
  #----------------------------------------------------------------------------
  db_allow_major_version_upgrade=false
  ##database modifications are applied immediately or not
  #false indicates during the next maintenance window. Default is false.
  db_apply_changes_immediately=false 
  # Indicates that minor engine upgrades will be applied automatically 
  #to the DB instance during the maintenance window. Defaults to true. 
  db_auto_minor_version_upgrade=true
  db_backup_retention_period=7 # 0 indicates dont perform any backup
  #The daily time range in UTC timezone. 2 hours behind CEST
  # current AWS region is eu-central-1 
  #hence backup will be done on 06:00-07:00 CEST
  db_backup_window="04:00-05:00"
  db_maintenance_window="Mon:00:00-Mon:02:00"
  db_is_multi_az=false # true is good for HA
  db_is_copy_tags_to_snapshot=true
  db_delete_automated_backups=true
  db_enabled_cloudwatch_logs_exports=["postgresql", "upgrade"]
  # --  common for tags
  region      = "eu-central-1" # change it based on region
  region_id   = "euc1"         # change it in context of region 
  seq_id      = "001"
  environment = "n"        # change it
  cost_centre = "sys"      # change it 	
  build_date  = "26042020" # change it
  version_id  = "001"      #change it
  app_service = "aflw"
  vpc_seq_id  = "001"
  common_tags = local.common_tags
}
 ` ` `