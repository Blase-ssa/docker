ARG NODE_VERSION="slim-bullseye"
ARG APP_NAME="authenticator"

FROM python:${NODE_VERSION} as build

# install Python
RUN apt update && apt install python3 python3-pip -y
# install dependency
RUN pip3 install uwsgi flask google-auth google-auth-oauthlib

# create workspace
RUN mkdir -p /opt/workspace/${APP_NAME}
COPY ${APP_NAME}.py /opt/workspace/${APP_NAME}/
COPY ${APP_NAME}.ini /opt/workspace/${APP_NAME}/

# clean image
RUN apt-get clean \
    rm -rf /var/lib/apt/lists/* \
    rm -rf ${TMP_DIR}

# expose server port
EXPOSE 3099

# run server
CMD [ "npx", "dalai", "serve" ]
