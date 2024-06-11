FROM debian:11

LABEL This is the nginx container

# RUN sudo apt update && sudo apt upgrade
# RUN sudo apt install nginx

COPY src/config.sh  .
COPY src/nginx.conf .

RUN chmod +x config.sh

# ENTRYPOINT ["/bin/bash"]

EXPOSE 443

CMD ["./config.sh"]