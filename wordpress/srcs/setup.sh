#!/bin/sh

apk update
apk add curl nginx mysql-client php7-fpm php7-common				\
    	php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli	\
    	php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap	\
    	php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap	\
    	php7-ctype php7-dom php7-openssl php7-gmp php7-pdo_odbc     \
    	php7-zip php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath	\
    	php7-odbc php7-pdo_sqlite php7-xmlreader php7-bz2 php7-pdo_dblib

if [[ ! -d /var/run/nginx ]]; then
	mkdir -p /var/run/nginx
fi

mkdir /var/www/

if [[ ! -f /var/www/wordpress/index.php ]]; then
	
	tar -xvf /tmp/latest.tar.gz
	mv wordpress /var/www/

	tfile=`mktemp`
	cat > $tfile << EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER '$USERNAME'@'%' IDENTIFIED BY '$PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$USERNAME'@'%' WITH GRANT OPTION;
EOF

#	mysql -hmysql -uroot -p$MYSQL_ROOT_PASSWORD < $tfile
#	rm -f $tfile
	
#	if [[ -f /tmp/wordpress.sql  ]]; then
#		mysql -hmysql -Dwordpress -uroot -p$MYSQL_ROOT_PASSWORD < /tmp/wordpress.sql
#	fi

fi

adduser --no-create-home -D $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd
chmod -R 755 /var/www/
chown -R $USERNAME:$USERNAME /var/www/wordpress

PHP_CGI_FIX_PATHINFO=0
sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo= ${PHP_CGI_FIX_PATHINFO}|i" /etc/php7/php.ini

#php-fpm7 & nginx -g "daemon off;"
