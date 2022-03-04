# Create a vpc for the github runners
resource "aws_vpc" "spotrunner" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "SpotRunnerVPC"
  }
}

# Create a subnet for the spot runner instances
resource "aws_subnet" "subspotrunner" {
  cidr_block        = "${cidrsubnet(aws_vpc.spotrunner.cidr_block, 4, 2)}"
  vpc_id            = "${aws_vpc.spotrunner.id}"
  availability_zone = "us-east-1a"
  tags = {
    Name = "SpotRunnerSubnet"
  }
}

# Create an elastic ip for the spot instance
resource "aws_eip" "spotrunnerip" {
  instance = "${aws_spot_instance_request.spotrunner.spot_instance_id}"
  vpc      = true
  tags = {
    Name = "SpotRunnerIp"
  }
}

# Create a internet gateway for the spot instances
resource "aws_internet_gateway" "spotrunnergw" {
  vpc_id = "${aws_vpc.spotrunner.id}"
  tags = {
    Name = "SpotRunnerGw"
  }
}

# Create a route table for the instances
resource "aws_route_table" "rtspotrunner" {
  vpc_id = "${aws_vpc.spotrunner.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.spotrunnergw.id}"
  }
  tags = {
    Name = "RtSpotRunner"
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.subspotrunner.id}"
  route_table_id = "${aws_route_table.rtspotrunner.id}"
}

#Create a private key for the instance
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create a key pair "spotKey" to connect to the spot instance
resource "aws_key_pair" "kp" {
  key_name   = "spotKey"       
  public_key = tls_private_key.pk.public_key_openssh
  tags = {
    Name = "SpotRunnerKey"
  }
}

# Create a local resource to store the key "spotKey.pem"
resource "local_file" "pk" {
 content = tls_private_key.pk.private_key_pem
 filename = "spotKey.pem"
 file_permission = 0400
}


# Create the spot instance request
resource "aws_spot_instance_request" "spotrunner" {
  ami                    = "ami-038b3df3312ddf25d"  # AMI Linux2
  spot_price             = "0.0016"  # 0.0016, $0.0031, 0.0062, $0.0084
  instance_type          = "t3.nano" # t3.nano t3.micro t3.small a1.medium
  spot_type              = "one-time" # After finished by price change, it would not be requested again
  wait_for_fulfillment   = "true"  
  key_name               = "spotKey"

  security_groups = ["${aws_security_group.allow_https_ssh.id}"]
  subnet_id = "${aws_subnet.subspotrunner.id}"

  user_data = templatefile("./spot.sh", {GITHUB_TOKEN = var.GITHUB_TOKEN, CONTROLLERURL = var.CONTROLLERURL, USERNAME = var.USERNAME, PASSWORD = var.PASSWORD, ORGGITHUB_TOKEN = var.ORGGITHUB_TOKEN, RUNNER_REPO = var.RUNNER_REPO, RUNNER_PATH = var.RUNNER_PATH, RUNNER_VERSION= var.RUNNER_VERSION})
  	tags = {
  		Name = "GitHub-Runner"
  	}
}

resource "aws_security_group" "allow_https_ssh" {
  name = "allow_https_ssh"
  description = "Allow https and ssh inbound traffic"
  vpc_id      = "${aws_vpc.spotrunner.id}"
  ingress {
    description = "https"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_https_ssh"
    Reference = "SpotRunnerSg"
  }
}