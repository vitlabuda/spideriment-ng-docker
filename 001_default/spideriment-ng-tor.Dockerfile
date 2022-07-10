# syntax=docker/dockerfile:1

FROM debian:bullseye-slim

RUN addgroup --gid=24702 spideriment-ng-tor && \
    adduser --uid=24702 --gid=24702 --disabled-login --disabled-password --gecos="Spideriment-NG Tor" spideriment-ng-tor
RUN apt-get update && \
    apt-get install -y tor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./extra_container_files/spideriment-ng-tor_docker-run.sh ./extra_container_files/spideriment-ng-tor_torrc.conf /

USER spideriment-ng-tor:spideriment-ng-tor
STOPSIGNAL SIGINT
EXPOSE 9050/tcp
ENTRYPOINT []
CMD ["/spideriment-ng-tor_docker-run.sh"]
