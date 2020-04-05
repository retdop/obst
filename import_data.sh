#!/usr/bin/env bash

# This imports csv data into the table with the help of the pgloader tool
# The mapping of column names is done with the order of the csv columns : the columns mentionned here are the tables'

. ./config.sh

pgloader --field item,price_eur,bio,country,source \
--with "skip header = 1" \
--with "fields terminated by ','" \
fruits_legumes_prix.csv \
postgres://$pg_username:$pg_password@$pg_host:$pg_port/${pg_dbname}\?tablename=prices

