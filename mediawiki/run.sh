#!/bin/sh

docker run --name mewiki --link mesql:mysql -p 8080:80 --env="MYSQL_PORT_3306_TCP=172.17.0.2" -d synctree/mediawiki
