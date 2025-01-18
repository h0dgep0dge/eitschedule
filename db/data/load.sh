#!/bin/bash

psql -U postgres < /data/schema.sql # doesn't pick the database because this sql file drops the database

python3 /data/parse.py | psql -U postgres schedule
