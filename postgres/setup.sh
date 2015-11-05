#!/bin/bash
set -e

echo "[INFO] Initializing postgres setup"
# Warehouse
# create database
createdb -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres warehouse
# create tables
echo "[INFO] Executing create tables"
psql -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres -d warehouse -a -f /warehouse.sql

createdb -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres subscription
# create tables
echo "[INFO] Executing create tables"
psql -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres -d warehouse -a -f /subscription.sql
#others - add creatdb line and after psql line for your service
