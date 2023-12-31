FROM oven/bun:debian

RUN         apt update -y && apt upgrade -y && apt install -y wget ffmpeg iproute2 git python3 python3-dev ca-certificates dnsutils tzdata zip tar curl libtool

RUN         bun upgrade

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
