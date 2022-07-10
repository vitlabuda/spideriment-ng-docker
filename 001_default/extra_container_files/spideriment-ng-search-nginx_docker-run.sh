#!/bin/bash


WAIT_FOR_HOST_PORTS="
spideriment-ng-search,3031
"


for HOST_PORT in ${WAIT_FOR_HOST_PORTS}
do
    IFS="," read -a HOST_PORT <<< "${HOST_PORT}"

    while ! nc -z "${HOST_PORT[0]}" "${HOST_PORT[1]}"
    do
        echo "# Waiting for ${HOST_PORT[0]}:${HOST_PORT[1]} to be open..."
        sleep 1
    done
done

echo "# All the required ports have been opened!"


exec /docker-entrypoint.sh nginx -g "daemon off;"
