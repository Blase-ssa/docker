# ARG variables
ARG NODE_VERSION="slim-bullseye"

# create create a container
FROM python:${NODE_VERSION} as build

# ENV variables
ENV APP_NAME="authenticator"
ENV APP_WORKSPACE="/opt/workspace/${APP_NAME}"

# install Python
RUN apt update && apt install python3 python3-pip -y
# install dependency
RUN pip3 install uwsgi flask google-auth google-auth-oauthlib

# create workspace
RUN mkdir -p ${APP_WORKSPACE}
COPY ${APP_NAME}.py ${APP_WORKSPACE}/
COPY ${APP_NAME}.ini ${APP_WORKSPACE}/

# clean image
RUN apt-get clean; \
    rm -rf /var/lib/apt/lists/*

# expose server port
EXPOSE 3099

# run server
#CMD /usr/local/bin/uwsgi --ini ${APP_WORKSPACE}/${APP_NAME}.ini
CMD ["/bin/bash", "-c", "cd ${APP_WORKSPACE};/usr/local/bin/uwsgi --ini ${APP_NAME}.ini"]
