# syntax=docker/dockerfile:1

FROM debian:bullseye-slim

RUN addgroup --gid=24701 spideriment-ng && \
    adduser --uid=24701 --gid=24701 --disabled-login --disabled-password --gecos="Spideriment-NG" spideriment-ng
RUN apt-get update && \
    apt-get install -y python3 python3-pip netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./spideriment-ng/src/requirements.txt ./
RUN pip3 install -r ./requirements.txt

COPY ./extra_container_files/spideriment-ng_docker-run.sh ./
COPY ./spideriment-ng/src ./src/

USER spideriment-ng:spideriment-ng
STOPSIGNAL SIGTERM
ENTRYPOINT []
CMD ["./spideriment-ng_docker-run.sh"]
