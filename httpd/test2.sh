#!/bin/sh

docker run \
    --name test2 \
    -p 8081:80 \
    -d httpd:2.4