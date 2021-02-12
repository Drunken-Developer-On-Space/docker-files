FROM ubuntu:14.04
LABEL mainteiner "Dry8r3aD <me@dry8r3ad.com>"

RUN apt update && apt install mysql-server -y

VOLUME /var/lib/mysql

EXPOSE 3306

RUN ["/bin/sh", "-c", "service mysql start"]

