FROM nwylynko/bun:0.2.0-alpine

RUN         apk update && apk add wget ffmpeg iproute2 git sqlite python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-base libtool iputils


RUN         bun upgrade
RUN         bun install

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]