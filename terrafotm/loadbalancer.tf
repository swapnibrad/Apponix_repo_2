# resource "aws_lb_target_group" "home" {
#   name     = "lb-tg-home"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = data.aws_vpc.default.id
#   tags = {
#     purpose = "lb-tg-home"
#   }
# }

# resource "aws_lb_target_group" "mobile" {
#   name     = "lb-tg-mobile"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = data.aws_vpc.default.id
#    health_check {
#     path                = "/mobile"
#     protocol            = "HTTP"
#     matcher             = "200"
#     interval            = 30
#     timeout             = 5
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#   }
#   tags = {
#     purpose = "lb-tg-mobile"
#   }
# }


# resource "aws_lb" "example" {
#   name               = "academy-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [data.aws_security_group.default.id]
#   subnets            = [
#     "subnet-0ec15776f4a7508e9",
#     "subnet-062c56946ae01696c"
#   ]

#   enable_deletion_protection = false
#   ip_address_type             = "ipv4"
# }


# resource "aws_lb_listener" "http" {
#   load_balancer_arn = aws_lb.example.arn
#   port              = 80
#   protocol          = "HTTP"
#   default_action {
#     type             = "forward"
#     forward {
#       target_group {
#         arn    = aws_lb_target_group.home.arn
#         weight = 1
#       }
#       target_group {
#         arn    = aws_lb_target_group.mobile.arn
#         weight = 1
#       }
#     }
#   }
# }