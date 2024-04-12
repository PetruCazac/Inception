FROM debian:11

LABEL This is the Wordpres image

COPY src/config.sh .
COPY src/wp-config.php .
COPY src/www.conf .

EXPOSE 9000

RUN bash config.sh

CMD ["/usr/bin/php-fpm7.4"]