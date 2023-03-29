ARG SYSTEM_ARCH="arm64"

# Container for the Teleport
FROM arm64v8/ubuntu:latest

# Install required dependencies
RUN apt-get update && apt-get install -y curl

# clean image
RUN apt-get clean; \
    rm -rf /var/lib/apt/lists/* 

# create a default configuratins files for teleport if they not exists
RUN [ ! -d /etc/teleport ] && mkdir -p '/etc/teleport';\
    [ ! -f /etc/teleport/teleport.yaml ] && teleport configure -o /etc/teleport/teleport.yaml

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
