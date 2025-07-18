module "prdo" {

    source = "../templet_for_module-day-9"
    ami_id = "ami-05ffe3c48a9991133"
    instance_type = "t2.micro"
    key = "Hello.key"
    az = "eu-central-1"

}