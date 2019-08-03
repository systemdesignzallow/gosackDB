FROM mariadb/server:10.3

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN apt-get update -y && apt-get install curl -y

# RUN echo 'mysql -u root -p$MARIADB_ROOT_PASSWORD < bootstrap.sql' > /docker-entrypoint-initdb.d/start.sh

# expose port for maria
EXPOSE 3306

# sudo docker run -eMARIADB_ROOT_PASSWORD=mypassword -d -p 3306:3306 mysql:5.7.13
# mysql -hlocalhost --protocol=TCP -uroot -p1234

# sudo docker run -d --name newdb -p 3306:3306 -e MARIADB_ROOT_PASSWORD=mypassword gosackdb

# sudo docker exec -it newdb mysql -hlocalhost --protocol=TCP -u root -p$MARIADB_ROOT_PASSWORDuake69 

# sudo docker exec -it newdb curl https://gosackdata.s3-us-west-1.amazonaws.com/bootstrap.sql -o bootstrap.sql

# https://gosackdata.s3-us-west-1.amazonaws.com/bootstrap.sql

# docker run -d -p 12345:3306 my-image
