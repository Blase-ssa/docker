# syntax=docker/dockerfile:1
# Container for SoftEther VPN Administrator Web UI
# https://github.com/notisrac/SoftEtherAdmin

ARG NODE_VERSION="19-bullseye-slim"

FROM node:${NODE_VERSION} as build
SHELL ["/bin/bash", "-c"]
# Install SoftEther VPN server and wget to download Web UI
RUN apt update && apt install -y softether-vpncmd wget && \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* 

# install Web UI
RUN wget -O /tmp/SoftEtherAdmin.zip https://github.com/notisrac/SoftEtherAdmin/archive/master.zip && \
    mkdir -p /srv && \
    unzip /tmp/SoftEtherAdmin.zip -d /tmp \
    mv /tmp/SoftEtherAdmin-master/* /srv/SoftEtherAdmin/ && \
    rm -f /tmp/SoftEtherAdmin.zip && \
    cd /srv/SoftEtherAdmin && \
    npm install; \
    npm audit fix

# http://localhost:8000 - Web UI
EXPOSE 8000/tcp

CMD [ "node", "/srv/SoftEtherAdmin/app.js" ]