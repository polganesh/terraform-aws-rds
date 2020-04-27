
example 

 ` ` `
module "nlb" {
  source = "../../terraform-aws-load-balancer"
  # common
  region             = "eu-central-1"
  region_id          = "euc1"
  seq_id             = "001"
  environment        = "n"
  cost_centre        = "infra"
  build_date         = "19022020"
  version_id         = "001"
  app_service        = "oozietst"
  is_lb_internal     = "true"
  lb_type            = "network"
  lb_subnets_id_list = ["subnet-bc9e01d7", "subnet-58855a25"]
  vpc_id             = "vpc-4c6fa427"

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    }
  ]
  
  target_groups = [
   {
      backend_protocol     = "TCP"
      backend_port         = 83
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/healthz"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
      }
    }
  ]
}
 ` ` `