FROM debian:11

LABEL This is the nginx container

COPY src/config.sh  .
COPY src/nginx.conf .

RUN chmod +x config.sh

EXPOSE 443

CMD ["./config.sh"]