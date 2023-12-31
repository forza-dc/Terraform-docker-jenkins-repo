resource "aws_launch_configuration" "lc" {
  name_prefix   = "lc"
  image_id      = "ami-008bcc0a51a849165"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/user-data.sh")
  associate_public_ip_address = true
  #iam_instance_profile = "ec2"
  security_groups = data.aws_security_groups.sg.ids
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  
  name                      = "st_forza-asg"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = aws_launch_configuration.lc.name
  #availability_zones           = [data.aws_availability_zone.az.id]
  vpc_zone_identifier       = data.aws_subnet_ids.available_db_subnet.ids

  timeouts {
    delete = "20m"
  }

  tag {
    key                 = "Name"
    value               = "asg"
    propagate_at_launch = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  alb_target_group_arn   = aws_lb_target_group.alb_target_group.arn
}