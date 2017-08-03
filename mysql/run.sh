#!/bin/sh

docker run \
        --name mysql \
        -v /home/wmoore/sandbox/docker/docker-sandbox/mysql/conf.d:/etc/mysql/conf.d \
        -v /home/wmoore/sandbox/docker/docker-sandbox/mysql/initdb.d:/docker-entrypoint-initdb.d \
        -v /home/wmoore/sandbox/docker/docker-sandbox/mysql/data:/var/lib/mysql \
        -e MYSQL_ROOT_PASSWORD=mydbpass \
        -d mysql
