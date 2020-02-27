resource "aws_network_acl" "main" {
    vpc_id = "${aws_vpc.my-vpc.id}"

    ingress {
        protocol = "tcp"
        rule_no = 100
        action = "allow"
        cidr_block = "10.0.1.0/24"
        from_port = 80
        to_port = 80
    }
}