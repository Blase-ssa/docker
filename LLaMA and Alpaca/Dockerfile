# syntax=docker/dockerfile:1

ARG NODE_VERSION="19-bullseye-slim"

FROM node:${NODE_VERSION} as build

# install Python and build-essential
RUN apt update && apt install build-essential python3-venv -y

# install alpaca and llma models (in 2 steps)
RUN npx dalai alpaca install 7B
RUN npx dalai llama install 7B

# clean image
RUN rm -rf /var/lib/apt/lists/*

# check versions
RUN python3 --version; \
    node --version; \
    npm --version

# expose server port
EXPOSE 3000

# run server
CMD [ "npx", "dalai", "serve" ]
