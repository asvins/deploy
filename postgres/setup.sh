#!/bin/bash
set -e

echo "[INFO] Initializing postgres setup"

for file in * 
do
	if [[ ${file: -4} == ".sql" ]]
	then
		echo "[INFO] Configuring database ${file%%.*}"
		createdb -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres ${file%%.*}
		psql -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} -U postgres -d ${file%%.*} -a -f /${file}
	fi
done

echo "[INFO] Done!"

