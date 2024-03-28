FROM debian:11

LABEL This is the MariaDB image

COPY src/config.sh .
COPY src/50-server.cnf .

RUN /bin/bash config.sh

RUN rm /config.sh

# ENTRYPOINT ["/bin/bash"]

# CMD ["exec", "mysqld_safe"]

