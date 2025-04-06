module "identity" {
  
  compartment_name = local.workspace["compartment"]


  source = "./modules/identity"
}

module "networking" {
  
  


  source = "./modules/networking"
}