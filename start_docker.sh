#!/bin/bash

docker run --net host --rm -d -e POSTGRES_PASSWORD=tinykite04 -p 5432:5432 postgres
docker run --net host --rm -d -v ./web:/var/www/html -p 80:80 -p 443:443 634f7639e84afa09c2b65ae591679637a5d2ee390ea31e19fe929861a7d6ba02

psql -h localhost -U postgres < db.sql