FROM debian:11

LABEL This is the Wordpres image

COPY src/config.sh .
# COPY src/wp-config.php .
COPY src/www.conf .

EXPOSE 9000

RUN chmod +x config.sh

CMD ["./config.sh"]