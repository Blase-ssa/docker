# Container for SoftEther VPN server
FROM arm64v8/ubuntu:latest

# Install SoftEther VPN server and wget to download Web UI
RUN apt update && apt install -y softether-vpnserver \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* 

# expose ports
EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 992/tcp 
EXPOSE 1194/tcp
EXPOSE 5555/tcp

CMD [ "executable" ]