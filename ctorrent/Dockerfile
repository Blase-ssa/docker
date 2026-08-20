# syntax=docker/dockerfile:1

# ARG ARC="arm64v8"
ARG ARC="amd64"

FROM ${ARC}/ubuntu:latest
# ENV NOIP_VERSION="2.1.9-1"
# Install pre requirements 
RUN apt update && apt install ctorrent;\
 apt autoremove -y &&\
 apt clean;\
 rm -rf /usr/local/src/*

# Run server
# CMD  /usr/local/bin/noip2 -d > /var/log/noip.log && tail -F /var/log/noip.log
CMD sleep 3600
