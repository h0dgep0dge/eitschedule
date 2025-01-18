FROM postgres

RUN apt update && apt -y install python3
RUN mkdir /data

COPY [ "data/data.csv", "data/schema.sql", "data/parse.py", "/data/" ]
COPY data/load.sh /docker-entrypoint-initdb.d/
