#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo yum install git -y
cd ~

git clone https://github.com/systemdesignzallow/gosackDB
cd gosackDB
mkdir data
sudo mount /dev/xvdb data

sudo docker pull mariadb/server:10.3
sudo docker build --build-arg MARIADB_ROOT_PASSWORD=mypassword -t gosackdb .
sudo docker run -d --name newdb -p 3306:3306 -eMARIADB_ROOT_PASSWORD=mypassword gosackdb