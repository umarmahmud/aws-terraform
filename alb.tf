resource "aws_lb" "load_balancer" {
    internal = false
    load_balancer_type = "application"
    subnets = ["${aws_subnet.public-subnet.id}", "${aws_subnet.private-subnet.id}"]
    tags = {
        Name = "app-load-balancer"
    }
}

resource "aws_lb_target_group" "tg" {
    port = 80
    protocol = "HTTP"
    vpc_id = "${aws_vpc.my-vpc.id}"
}

resource "aws_lb_target_group_attachment" "attach_lb" {
    target_group_arn = "${aws_lb_target_group.tg.arn}"
    target_id = "${aws_instance.server.id}"
}

resource "aws_lb_listener" "incoming" {
    load_balancer_arn = "${aws_lb.load_balancer.arn}"
    port = "80"
    protocol = "HTTP"

    default_action {
        type = "forward"
        // target group should be private ec2 instance
        target_group_arn = "${aws_lb_target_group.tg.arn}"
    }
}