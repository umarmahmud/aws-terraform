resource "aws_instance" "server" {
    ami = "ami-0e2ff28bfb72a4e45"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.private-subnet.id}"

    provisioner "file" {
        source = "nginx.sh"
        destination = "./nginx.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x ./nginx.sh",
            "./nginx.sh"
        ]
    }

    tags = {
        Name = "server"
    }
}