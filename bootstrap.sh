#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo yum install git -y
git clone https://github.com/systemdesignzallow/gosackDB
cd gosackDB
sudo docker pull mariadb/server:10.3
sudo docker build --build-arg MARIADB_ROOT_PASSWORD=mypassword -t gosackdb .
sudo docker run -d --name newdb -eMARIADB_ROOT_PASSWORD=mypassword gosackdb
sudo docker exec -it newdb curl https://gosackdata.s3-us-west-1.amazonaws.com/small.csv -o /var/lib/mysql/data.csv
sudo docker exec -it newdb mysql -u root -p$MARIADB_ROOT_PASSWORD < bootstrap.sql


# sudo docker exec -it newdb mysql -u root -p$MARIADB_ROOT_PASSWORD -e 'select * from homes' gosackDB