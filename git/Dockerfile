# syntax=docker/dockerfile:1

#Processor architecture
ARG ARC

FROM ${ARC}/ubuntu:latest

# Install pre requirements 
RUN apt update &&\
	apt install wget zip git -y;\
	apt autoremove -y;\
	apt clean;\
	rm -rf /usr/local/src/*

RUN mkdir /opt/git
# Download and unzip Xray
WORKDIR /opt/git

# Run server
CMD git pull
