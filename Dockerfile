FROM debian

RUN apt update && apt -y install python3 sqlite3

WORKDIR /data
COPY ["data/load.sh", "data/data.csv", "data/schema.sql", "data/parse.py", "/data/"]
RUN /data/load.sh

FROM php:apache

COPY --from=0 /data/schedule.db /var/www/html/
COPY ./html /var/www/html
