# syntax=docker/dockerfile:1

FROM nginx:stable-alpine

RUN apk add --no-cache bash

RUN rm -f /etc/nginx/conf.d/*.conf
COPY ./extra_container_files/spideriment-ng-search-nginx_nginx.conf /etc/nginx/conf.d/
COPY ./extra_container_files/spideriment-ng-search-nginx_docker-run.sh /

EXPOSE 8031/tcp
ENTRYPOINT []
CMD ["/spideriment-ng-search-nginx_docker-run.sh"]
