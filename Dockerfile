FROM mariadb/server:10.3

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN apt-get update -y && apt-get install curl -y

RUN echo 'curl https://gosackdata.s3-us-west-1.amazonaws.com/small.csv -o /var/lib/mysql/data.csv' >> /docker-entrypoint-initdb.d/start.sh

RUN echo 'mysql -u root -p$MARIADB_ROOT_PASSWORD < bootstrap.sql' >> /docker-entrypoint-initdb.d/start.sh

# expose port for maria
EXPOSE 3306

