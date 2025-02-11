#!/bin/bash

sqlite3 schedule.db < schema.sql
python3 parse.py | sqlite3 schedule.db
