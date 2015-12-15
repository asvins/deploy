if [[ $1 == "" ]]
then
	echo "[INFO] arg = postgres container id"
else
	docker exec -it $1 psql -U postgres -d operations -c "COPY packs TO stdout DELIMITER ',' CSV HEADER;" > packs.csv
	docker exec -it $1 psql -U postgres -d operations -c "COPY pack_medications TO stdout DELIMITER ',' CSV HEADER;" > pack_medications.csv
	docker exec -it $1 psql -U postgres -d core -c "COPY medications TO stdout DELIMITER ',' CSV HEADER;" > medications.csv
fi

