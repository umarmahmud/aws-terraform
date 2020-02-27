resource "aws_security_group" "allow-http" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/1"]
    }
    
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}