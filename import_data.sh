#!/usr/bin/env bash

# This imports csv data into the table with the help of the pgloader tool
# The mapping of column names is done with the order of the csv columns : the columns mentionned here are the tables'

. ./config.sh


for f in ./import/*.csv; do
    echo $f
    if [[ -f "$f" && -s "$f" ]]; then

	pgloader --field name,kind,type,unit,price_eur,bio,country,source \
	--with "skip header = 1" \
	--with "fields terminated by ','" \
	${f} \
	postgres://$pg_username:$pg_password@$pg_host:$pg_port/${pg_dbname}\?tablename=prices
    else
        echo "file $f is empty"
    fi
done;

