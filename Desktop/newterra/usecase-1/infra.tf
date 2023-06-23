module "vpc" {
  source = "../vpc_module"


}
module "compute-service" {
  source = "../ec2_module"
  depends_on = [module.vpc]
}

module "database" {
  source = "../rds_module"
  depends_on = [module.vpc]
   
}

module "alb" {
  source     = "../scaling_module"
  depends_on = [module.vpc]

}



