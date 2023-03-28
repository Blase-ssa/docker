ARG SYSTEM_ARCH="arm64"
ARG TELEPORT_VERSION="12.1.1"
ARG TMP_DIR=/tmp/src

# Container for the Teleport
FROM arm64v8/ubuntu:latest

# Install required dependencies
# RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN apt-get update && apt-get install -y curl

# download and install teleport
RUN mkdir -p ${TMP_DIR} && cd ${TMP_DIR} \
    && curl -O https://cdn.teleport.dev/teleport-v${TELEPORT_VERSION}-linux-${SYSTEM_ARCH}-bin.tar.gz \
    && tar -xvf teleport-v${TELEPORT_VERSION}-linux-${SYSTEM_ARCH}-bin.tar.gz \
    && cd teleport \
    && ./install

# clean image
RUN apt-get clean \
    rm -rf /var/lib/apt/lists/* \
    rm -rf ${TMP_DIR}

# expose ports
# Service proxy:ssh
EXPOSE 3023/tcp
# Service proxy:tunnel
EXPOSE 3024/tcp
# Service auth
EXPOSE 3025/tcp 
# Service proxy:web
EXPOSE 3080/tcp

# run Teleport
CMD ["teleport", "start"]
