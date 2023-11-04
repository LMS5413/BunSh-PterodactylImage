FROM oven/bun:debian

RUN         apt update -y && apt upgrade -y && apt install wget ffmpeg iproute2 git python3 python3-dev ca-certificates dnsutils tzdata zip tar curl libtool

RUN         bun init
RUN         bun upgrade
RUN         bun install

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]