FROM debian:11

LABEL This is the MariaDB image

RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y
RUN apt install iputils-ping -y

COPY ./src/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./src/config.sh .

RUN chmod +x config.sh

EXPOSE 3306

CMD ["./config.sh"]
