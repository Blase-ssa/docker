# Container for the Teleport
FROM arm64v8/ubuntu:latest

# Install required dependencies
RUN apt-get update && apt-get install -y curl

# Download Teleport's PGP public key and add Teleport APT repository
SHELL ["/bin/bash", "-c"]
RUN curl https://apt.releases.teleport.dev/gpg -o /usr/share/keyrings/teleport-archive-keyring.asc
RUN source /etc/os-release && \
    echo "deb [signed-by=/usr/share/keyrings/teleport-archive-keyring.asc] https://apt.releases.teleport.dev/${ID?} ${VERSION_CODENAME?} stable/v12" > /etc/apt/sources.list.d/teleport.list

# install Teleport
RUN apt-get update && apt-get install teleport

# clean image
RUN apt-get clean; \
    rm -rf /var/lib/apt/lists/* 

# create a default configuratins files for teleport if they not exists
RUN mkdir -p /etc/teleport; \
    teleport configure -o /etc/teleport/teleport.yaml

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
CMD ["teleport", "start", "-c", "/etc/teleport/teleport.yaml"]
