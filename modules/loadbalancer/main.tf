
resource "aws_lb" "load_balancer" {
  name               = "default-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer-sg.id] # security group id 
  subnets            = [for subnet_id in var.public_subnet : subnet_id.id]

  tags = {
    Name = "Default application load balancer"
  }

  depends_on = [aws_lb_target_group.load_balancer_target_group]
}

# Set up Load Balancer Security Group
resource "aws_security_group" "load_balancer-sg" {
  name   = "aws-lb-sg"
  vpc_id = var.VPC_id
}

resource "aws_vpc_security_group_ingress_rule" "tcp-ingress" {
  security_group_id = aws_security_group.load_balancer-sg.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80

  cidr_ipv4 = "80.115.85.185/32"
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
