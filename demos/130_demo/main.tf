/*
 # Simple creation of subnets using lists and count
module "vpc" {
  source = "./modules/vpc_simple"

  vpc_name       = "r130-demo-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  subnets_names = [ "subnet-1", "subnet-2" ]
  subnets_azs   = [ "eu-west-1a", "eu-west-1b" ]
  subnets_cidr_lists = [ "10.0.1.0/24", "10.0.2.0/24" ]
  subnets_map_public_ip = [ true, false ]
}*/



/* # Adding new subnets. But we forget to update last list correctly
module "vpc" {
  source = "./modules/vpc_simple"

  vpc_name       = "r130-demo-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  subnets_names = [ "subnet-1", "subnet-2", "subnet-3", "subnet-4" ]
  subnets_azs   = [ "eu-west-1a", "eu-west-1b", "eu-west-1a", "eu-west-1b" ]
  subnets_cidr_lists = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24" ]
  subnets_map_public_ip = [ true, false, true, true, false ]
}*/



/* # Removing not needed subnet-3. Ooops!
module "vpc" {
  source = "./modules/vpc_simple"

  vpc_name       = "r130-demo-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  subnets_names = [ "subnet-1", "subnet-2", "subnet-4" ]
  subnets_azs   = [ "eu-west-1a", "eu-west-1b", "eu-west-1b" ]
  subnets_cidr_lists = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.4.0/24" ]
  subnets_map_public_ip = [ true, false, true, false ]
}
*/



/* # Using map(any)
module "vpc" {
  source = "./modules/vpc_map_any"

  vpc_name       = "r130-demo-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  subnets_parameters = {
    "subnet-1" = {
      name = "subnet-1",
      az = "eu-west-1a",
      cidr = "10.0.1.0/24",
      map_public_ip = true
    },
    "subnet-2" = {
      name = "subnet-2",
      az = "eu-west-1b",
      cidr = "10.0.2.0/24",
      map_public_ip = false
    }
  }
}*/



/* # Using map(any) - adding new subnets.
module "vpc" {
  source = "./modules/vpc_map_any"

  vpc_name       = "r130-demo-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  subnets_parameters = {
    "subnet-1" = {
      name = "subnet-1",
      az = "eu-west-1a",
      cidr = "10.0.1.0/24",
      map_public_ip = true
    },
    "subnet-2" = {
      name = "subnet-2",
      az = "eu-west-1b",
      cidr = "10.0.2.0/24",
      map_public_ip = false
    },
    "subnet-3" = {
      name = "subnet-3",
      az = "eu-west-1a",
      cidr = "10.0.3.0/24",
      map_public_ip = true
    },
    "subnet-4" = {
      name = "subnet-4",
      az = "eu-west-1b",
      cidr = "10.0.4.0/24",
      map_public_ip = false
    }
  }
}*/



/* # Using map(any) - removing subnet-3 - OK
module "vpc" {
  source = "./modules/vpc_map_any"

  vpc_name       = "r130-demo-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  subnets_parameters = {
    "subnet-1" = {
      name = "subnet-1",
      az = "eu-west-1a",
      cidr = "10.0.1.0/24",
      map_public_ip = true
    },
    "subnet-2" = {
      name = "subnet-2",
      az = "eu-west-1b",
      cidr = "10.0.2.0/24",
      map_public_ip = false
    },
    "subnet-4" = {
      name = "subnet-4",
      az = "eu-west-1b",
      cidr = "10.0.4.0/24",
      map_public_ip = false
    }
  }
}*/


/*
 # Using map(any) - add subnet 5. Typo ;)
module "vpc" {
  source = "./modules/vpc_map_any"

  vpc_name       = "r130-demo-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  subnets_parameters = {
    "subnet-1" = {
      name = "subnet-1",
      az = "eu-west-1a",
      cidr = "10.0.1.0/24",
      map_public_ip = true
    },
    "subnet-2" = {
      name = "subnet-2",
      az = "eu-west-1b",
      cidr = "10.0.2.0/24",
      map_public_ip = false
    },
    "subnet-4" = {
      name = "subnet-4",
      az = "eu-west-1b",
      cidr = "10.0.4.0/24",
      map_public_ip = false
    },
    "subnet-5" = {
      name = "subnet-5",
      az = "eu-west-1a",
      cidr = "10.0.5.0/24",
      map_pubic_ip = true
    }
  }
}*/



/* # Using map(object())
module "vpc" {
  source = "./modules/vpc_map_object"

  vpc_name       = "r130-demo-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  subnets_parameters = {
    "subnet-1" = {
      name = "subnet-1",
      az = "eu-west-1a",
      cidr = "10.0.1.0/24",
      map_public_ip = true
    },
    "subnet-2" = {
      name = "subnet-2",
      az = "eu-west-1b",
      cidr = "10.0.2.0/24",
      map_public_ip = false
    }
  }
}*/



/* # Using map(object()) - typo
module "vpc" {
  source = "./modules/vpc_map_object"

  vpc_name       = "r130-demo-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  subnets_parameters = {
    "subnet-1" = {
      name = "subnet-1",
      az = "eu-west-1a",
      cidr = "10.0.1.0/24",
      map_public_ip = true
    },
    "subnet-2" = {
      name = "subnet-2",
      az = "eu-west-1b",
      cidr = "10.0.2.0/24",
      map_public_ips = false
    }
  }
}*/



/* # Using map(object()) - optional attribute
module "vpc" {
  source = "./modules/vpc_map_object"

  vpc_name       = "r130-demo-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  subnets_parameters = {
    "subnet-1" = {
      name = "subnet-1",
      az = "eu-west-1a",
      cidr = "10.0.1.0/24",
      map_public_ip = true
    },
    "subnet-2" = {
      name = "subnet-2",
      az = "eu-west-1b",
      cidr = "10.0.2.0/24"
    },
    "subnet-3" = {
      name = "subnet-3",
      az = "eu-west-1c",
      cidr = "10.0.3.0/24"
    }
  }
}*/
