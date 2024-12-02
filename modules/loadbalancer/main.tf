
resource "aws_lb" "load_balancer" {
  name               = "default-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [] # security group id 
  subnets            = [for subnet_id in var.public_subnet : subnet_id.id]

  tags = {
    Name = "Default application load balancer"
  }

}

# Target group and attachment 
resource "aws_lb_target_group" "load_balancer_target_group" {
  name     = "default-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.VPC_id
}

resource "aws_lb_target_group_attachment" "public_ec2_attachment" {
  target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
  target_id        = var.public_instance_id
}

# Load balancer Listener 
resource "aws_lb_listener" "load_balancer_listener" {

  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
  }

  depends_on = []
}
