#!/bin/sh

docker run \
    --name test1 \
    -p 8080:80 \
    -d httpd:2.2