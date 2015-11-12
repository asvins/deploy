#!/bin/bash
set -e

echo "[INFO] Initializing postgres setup"
# Warehouse
createdb -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres warehouse
echo "[INFO] Executing create warehouse tables"
psql -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres -d warehouse -a -f /warehouse.sql

# Subscription
createdb -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres subscription
echo "[INFO] Executing create subscription tables"
psql -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres -d subscription -a -f /subscription.sql

# Operations
createdb -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres operations
echo "[INFO] Executing create operations tables"
psql -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres -d operations -a -f /operations.sql
