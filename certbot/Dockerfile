# Container for the Teleport
FROM arm64v8/ubuntu:latest

# Install snapd to be able install certbot
RUN apt update

# install certbot
RUN DEBIAN_FRONTEND=noninteractive apt install -y certbot

# clean image
RUN apt-get clean; \
    rm -rf /var/lib/apt/lists/* 

# expose ports
EXPOSE 80/tcp
EXPOSE 443/tcp

# run Teleport
CMD ["/usr/bin/bash"]
