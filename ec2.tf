resource "aws_instance" "web" {
    ami = "ami-0e2ff28bfb72a4e45"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.private-subnet.id}"

    tags = {
        Name = "server"
    }

}