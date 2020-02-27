resource "aws_lb" "load_balancer" {
    internal = false
    load_balancer_type = "application"
    subnets = ["${aws_subnet.public-subnet.id}", "${aws_subnet.private-subnet.id}"]
    tags = {
        Name = "app-load-balancer"
    }
}

resource "aws_lb_listener" "incoming" {
    load_balancer_arn = "${aws_lb.load_balancer.arn}"
    port = "80"
    protocol = "HTTPS"
}