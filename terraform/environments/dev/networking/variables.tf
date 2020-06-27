variable "region"         {default = "eu-west-1"}
variable "name"           {default = "KitchenHelper-VPC"}
variable "vpc_cidr"       {default = "172.20.0.0/16"}
variable "cidrs"          {default = ["172.20.1.0/24","172.20.2.0/24","172.20.3.0/24"]} 
variable "priv_cidrs"     {default = ["172.20.4.0/24","172.20.5.0/24","172.20.6.0/24"]}
variable "azs"            {default = ["eu-west-1a","eu-west-1b","eu-west-1c"]}

