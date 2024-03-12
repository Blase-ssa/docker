# syntax=docker/dockerfile:1

# ARG ARC="arm64v8"
ARG ARC="amd64"

FROM ${ARC}/ubuntu:latest
# Install pre requirements 
RUN apt update && \
    apt install knockd iptables -y;\
    apt autoremove -y &&\
    apt clean;\
    rm -rf /usr/local/src/*

# allow port forwarding
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf && sysctl -p && sysctl --system

# 
EXPOSE 4000-4999

# Run server
CMD /opt/start.sh