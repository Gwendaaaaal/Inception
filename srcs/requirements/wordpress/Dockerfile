FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install vim curl wget php8.2 php-fpm php-mysql default-mysql-client mariadb-client -y;

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wget https://fr.wordpress.org/wordpress-6.9-fr_FR.tar.gz -P /var/www;
RUN cd /var/www && tar -xzf wordpress-6.9-fr_FR.tar.gz && rm wordpress-6.9-fr_FR.tar.gz;

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY conf/auto-wpscript.sh /
RUN chmod +x auto-wpscript.sh

EXPOSE 9000

RUN chown -R www-data:www-data /var/www/*
RUN chmod 755 /var/www/*

WORKDIR /var/www/wordpress

ENTRYPOINT ["bash", "/auto-wpscript.sh"]
