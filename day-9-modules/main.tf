module "prod" {
    source = "github.com/prince01702/terraform/templet_for_module-day-9"
    ami_id = "ami-05ffe3c48a9991133"
    instance_type = "t2.mirco"
    key ="hello.key"
    az ="eu-central-1"
  
}