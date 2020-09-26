resource "aws_elb" "bar" {
  name               = "wordpress"
  

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances                   = ["i-036671caa90a3b5f2"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "foobar-terraform-elb"
  }
}


# resource "aws_autoscaling_attachment" "wordpress" {
#   autoscaling_group_name = "wordpress-asg-20200314211836624000000002"
#   elb                    = "wordpress"
# }
