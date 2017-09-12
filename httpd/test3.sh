#!/bin/sh

docker run \
    --name test3 \
    -p 8082:80 \
    -v "$PWD"/public-html:/usr/local/apache2/htdocs \
    -d httpd