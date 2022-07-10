#!/bin/bash


WAIT_FOR_HOST_PORTS="
mariadb,3306
memcached,11211
spideriment-ng-tor,9050
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


exec python3 ./src/spideriment_ng/spideriment_ng.py /spideriment-ng.docker.toml
