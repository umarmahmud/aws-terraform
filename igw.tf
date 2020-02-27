resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.my-vpc.id}"
}

resource "aws_route_table" "aws_route_table_for_internet" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
}