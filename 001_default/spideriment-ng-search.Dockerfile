# syntax=docker/dockerfile:1

FROM debian:bullseye-slim

RUN addgroup --gid=24703 spideriment-ng-search && \
    adduser --uid=24703 --gid=24703 --disabled-login --disabled-password --gecos="Spideriment-NG Search" spideriment-ng-search
RUN apt-get update && \
    apt-get install -y python3 python3-pip netcat-openbsd uwsgi uwsgi-plugin-python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./spideriment-ng-search/src/requirements.txt ./
RUN pip3 install -r ./requirements.txt

COPY ./extra_container_files/spideriment-ng-search_docker-run.sh ./extra_container_files/spideriment-ng-search_uwsgi.ini ./
COPY ./spideriment-ng-search/src ./src/

USER spideriment-ng-search:spideriment-ng-search
STOPSIGNAL SIGTERM
EXPOSE 3031/tcp
ENTRYPOINT []
CMD ["./spideriment-ng-search_docker-run.sh"]
