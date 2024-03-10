# syntax=docker/dockerfile:1

# ARG ARC="arm64v8"
ARG ARC="amd64" 

FROM ${ARC}/ubuntu:latest
ENV NOIP_VERSION="2.1.9-1"
# Install pre requirements 
RUN apt update && apt install make gcc wget tar -y

# Download and untar noip
WORKDIR /usr/local/src/
RUN wget http://www.noip.com/client/linux/noip-duc-linux.tar.gz && tar xf noip-duc-linux.tar.gz

# Make install
WORKDIR /usr/local/src/noip-${NOIP_VERSION}/
RUN make &&\
 cp noip2 /usr/local/bin &&\
 touch /var/log/noip.log &&\
 chmod a+rw /var/log/noip.log

# Clean system
WORKDIR /
RUN apt remove make gcc wget tar -y ;\
 apt autoremove -y &&\
 sudo apt clean;\
 rm -rf /usr/local/src/*

# Run server
CMD  /usr/local/bin/noip2 -d > /var/log/noip.log && tail -F /var/log/noip.log
