resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "my-vpc"
    }
}

resource "aws_subnet" "public-subnet" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "public-subnet"
    }
}

resource "aws_subnet" "private-subnet" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "private-subnet"
    }
}
