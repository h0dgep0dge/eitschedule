#!/bin/bash


docker built -t h0dgep0dge/pgphpapache .

docker stop postgres httpd

docker run --net host --name postgres --rm -d -e POSTGRES_PASSWORD=tinykite04 -p 5432:5432 postgres
docker run --net host --name httpd --rm -d -v ./web:/var/www/html -p 80:80 -p 443:443 h0dgep0dge/pgphpapache

sleep 5 # sometimes postgres isn't ready yet lmao

psql -h localhost -U postgres < db.sql
