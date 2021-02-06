FROM alpine
LABEL mainteiner "Dry8r3aD <me@dry8r3ad.com>"

RUN apk update
RUN apk add mysql

VOLUME /var/lib/mysql

EXPOSE 3306

RUN ["/bin/sh", "-c", "/usr/bin/mysqld --user=mysql"]

