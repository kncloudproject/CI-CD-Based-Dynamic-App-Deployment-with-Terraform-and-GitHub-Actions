#!/bin/bash

sudo yum update -y
sudo yum install docker -y

sudo yum install git -y
sudo yum install libicu -y

sudo systemctl enable docker