# syntax=docker/dockerfile:1

ARG NODE_VERSION="slim"

FROM node:${NODE_VERSION}

# install wget and zip
RUN apt update && apt install \
    wget \
    zip \
    -y &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /srv
RUN \
    mkdir -p vpnrpc && cd vpnrpc &&\
    npm install --save-dev vpnrpc
RUN \
    wget -O SoftEtherAdmin.zip https://github.com/notisrac/SoftEtherAdmin/archive/master.zip &&\
    unzip SoftEtherAdmin.zip &&\
    mv SoftEtherAdmin-* SoftEtherAdmin &&\
    rm SoftEtherAdmin.zip
RUN \
    cd /srv/SoftEtherAdmin &&\
    npm install &&\
    npm audit fix;\
    npm install pm2 -g

WORKDIR /srv/SoftEtherAdmin

# expose server port
EXPOSE 8000

# run server
CMD [ "pm2", "start", "app.js", "--name", "softetheradmin", "--no-daemon", "--log-type", "json"]
