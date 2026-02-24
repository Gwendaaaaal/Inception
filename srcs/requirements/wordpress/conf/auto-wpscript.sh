#!/bin/bash
#set -eux

cd /var/www/wordpress

until mysqladmin ping -h"${SQL_HOST}" -u"${SQL_USER}" -p"${SQL_PASSWORD}" --silent; do
  sleep 0.5
done

if ! [ -f "wp-config.php" ];then
	wp config create --allow-root --dbname=${SQL_DATABASE} \
		--dbuser=${SQL_USER} \
		--dbpass=${SQL_PASSWORD} \
		--dbhost=${SQL_HOST} \
		--url=https://${DOMAIN_NAME};

	wp core install --url=https://${DOMAIN_NAME} \
		--title=${SITE_TITLE} \
		--admin_user=${ADMIN_USER} \
		--admin_password=${ADMIN_PASSWORD} \
		--admin_email=${ADMIN_EMAIL} \
		--allow-root;

	wp user create ${USER1_LOGIN} ${USER1_MAIL} \
		--role=author \
		--user_pass=${USER1_PASS} \
		--allow-root;

	wp cache flush --allow-root

	wp plugin install contact-form-7 --allow-root --activate

	wp language core install en_US --allow-root --activate

	wp theme delete --allow-root twentynineteen twentytwenty
	wp plugin delete --allow-root hello

	wp rewrite structure --allow-root '/%postname%/'

fi

mkdir -p /run/php;

exec /usr/sbin/php-fpm8.2 -F -R
