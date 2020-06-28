variable "region"         {default = "eu-west-1"}
variable "name"           {default = "KitchenHelper-VPC"}
variable "vpc_cidr"       {default = "192.168.0.0/16"}
variable "cidrs"          {default = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24"]}
variable "private_cidrs"  {default = ["192.168.4.0/24","192.168.5.0/24","192.168.6.0/24"]}
variable "azs"            {default = ["eu-west-1a","eu-west-1b","eu-west-1c"]}
