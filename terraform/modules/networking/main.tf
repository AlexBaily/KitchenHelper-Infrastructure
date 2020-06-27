
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags { Name = "${var.environment_name}" } 
}

resource "aws_internet_gateway" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags { Name = "${var.environment_name}" }
}


resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${element(var.cidrs, count.index)}"
  availability_zone = "${element(var.azs, count.index)}"
  count             = "${length(var.cidrs)}"

  tags { Name = "${var.environment_name} ${element(var.azs, count.index)}" }
}

resource "aws_route_table" "public" {
  vpc_id           = "${aws_vpc.vpc.id}"
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.public.id}"
  }
}

resource "aws_route_table_association" "public_routes" {
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
  count          = 3
}


resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${element(var.priv_cidrs, count.index)}"
  availability_zone = "${element(var.azs, count.index)}"
  count             = 3

  tags { Name = "${var.environment_name} Private ${element(var.azs, count.index)}" }
}

resource "aws_route_table" "private" {
  vpc_id           = "${aws_vpc.vpc.id}"
}

resource "aws_route_table_association" "private_routes" {
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
  count          = 3
}
