# data "aws_ami" "amazon_linux" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
# }

# data "aws_vpc" "default" {
#   default = true
# }

# data "aws_security_group" "default" {
#   name   = "default"
#   vpc_id = data.aws_vpc.default.id
# }

# resource "aws_launch_template" "home" {
#   name_prefix   = "launch-template-home"
#   image_id      = data.aws_ami.amazon_linux.id
#   instance_type = "t2.micro"
#  description = "for testing purpose"
#   key_name = "nv_delete"

#   vpc_security_group_ids = [data.aws_security_group.default.id]

#   block_device_mappings {
#     device_name = "/dev/xvda"

#     ebs {
#       volume_size = 10
#       volume_type = "gp3"
#       delete_on_termination = true
#     }
#   }
#  user_data = base64encode(<<-EOF
#     #!/bin/bash
#     yum update -y
#     yum install httpd -y
#     systemctl start httpd
#     systemctl enable httpd
#     echo "<h1>Hello from Terraform</h1>" > /var/www/html/index.html
#   EOF
#   )


#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name = "as-instance-home"
#     }
#   }
# }


# resource "aws_launch_template" "mobile" {
#   name_prefix   = "launch-template-mobile"
#   image_id      = data.aws_ami.amazon_linux.id
#   instance_type = "t2.micro"
#  description = "for testing purpose"
#   key_name = "nv_delete"

#   vpc_security_group_ids = [data.aws_security_group.default.id]

#   block_device_mappings {
#     device_name = "/dev/xvda"

#     ebs {
#       volume_size = 22
#       volume_type = "gp3"
#       delete_on_termination = true
#     }
#   }

#  user_data = base64encode(<<-EOF
#     #!/bin/bash
#     yum update -y
#     yum install httpd -y
#     systemctl start httpd
#     systemctl enable httpd
#     mkdir /var/www/html/mobile
#     echo "<h1>Hello from swapnil Terraform mobile..</h1>" > /var/www/html/mobile/index.html
#   EOF
#   )


#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name = "as-instance-mobile"
#     }
#   }
# }

# resource "aws_autoscaling_group" "home" {
#   desired_capacity     = 1
#   max_size             = 4
#   min_size             = 1
#   vpc_zone_identifier  = [
#     "subnet-0ec15776f4a7508e9",
#     "subnet-062c56946ae01696c"
#   ]
#    target_group_arns = [aws_lb_target_group.home.arn]
#   # health_check_type         = "ELB"
#   health_check_grace_period = 300

#  instance_maintenance_policy {
#     min_healthy_percentage = 90
#     max_healthy_percentage = 120
#   }
#   launch_template {
#     id      = aws_launch_template.home.id
#     version = "$Latest"
#   }

#   tag {
#     key                 = "Name"
#     value               = "asg-instance-home"
#     propagate_at_launch = true
#   }
# }

# resource "aws_autoscaling_group" "mobile" {
#   desired_capacity     = 0
#   max_size             = 0
#   min_size             = 0
#   vpc_zone_identifier  = [
#     "subnet-0ec15776f4a7508e9",
#     "subnet-062c56946ae01696c"
#   ]
#   target_group_arns = [aws_lb_target_group.mobile.arn]
#   # health_check_type         = "ELB"
#   health_check_grace_period = 300

#  instance_maintenance_policy {
#     min_healthy_percentage = 90
#     max_healthy_percentage = 120
#   }
#   launch_template {
#     id      = aws_launch_template.mobile.id
#     version = "$Latest"
#   }

#   tag {
#     key                 = "Name"
#     value               = "asg-instance-mobile"
#     propagate_at_launch = true
#   }
# }

