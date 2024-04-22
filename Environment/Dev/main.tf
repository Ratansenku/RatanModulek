module "rgs" {
  source = "../../Module/1RG"
  rgs    = var.rgs
}
module "vnets" {
  depends_on = [module.rgs]
  source     = "../../Module/2VNET"
  vnets      = var.vnets
}
module "subnets" {
  depends_on = [module.vnets]
  source     = "../../Module/3SUBNET"
  subnets    = var.subnets
}
module "pips" {
  depends_on = [module.subnets]
  source     = "../../Module/4PIP"
  pips       = var.pips
}
module "nics" {
  depends_on = [module.pips]
  source     = "../../Module/5NIC"
  nics       = var.nics
}
module "nsgs" {
  depends_on    = [module.nics]
  source        = "../../Module/6NSG"
  nsgs          = var.nsgs
  security_rule = var.security_rule
}
module "nsga" {
  depends_on = [module.nsgs]
  source     = "../../Module/7NSGA"
  nsgas      = var.nsgas
}
module "vm" {
  depends_on = [module.nsga]
  source     = "../../Module/8VM"
  vms        = var.vms
}
module "sqlss" {
  depends_on = [module.vm]
  source     = "../../Module/9SQLS"
  sqlss      = var.sqlss
}
module "sqldb" {
  depends_on = [module.sqlss]
  source     = "../../Module/10SQLDB"
  sqldb      = var.sqldb
}
# module "bastionhost" {
#   depends_on   = [module.vnets, module.subnets, module.pips]
#   source       = "../../Module/11AzureBastion"
#   bastion_host = var.bastion_host
# }
module "keyvault" {
  depends_on = [module.rgs]
  source     = "../../Module/12KeyVault"
  keyvault   = var.keyvault
}
module "lb" {
  depends_on = [module.pips]
  source     = "../../Module/13LoadBalancer"
  lb         = var.lb
}