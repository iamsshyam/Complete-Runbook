resource "aws_ebs_volume" "trade_volume" {
  availability_zone = "us-west-2a"
  size              = 20
  type              = "gp3"
}

resource "aws_ebs_volume_attachment" "trade_attach" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.trade_volume.id
  instance_id = module.eks.worker_nodes[0].id
}
