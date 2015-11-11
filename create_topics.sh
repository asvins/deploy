kafka_file_path=".kafka_path"
topics_file_path="topics"

clear

if [[ -f $kafka_file_path ]]
then
	kafka_path=$(cat $kafka_file_path)
else
	echo "Type the path to your kafka home: "
	read kafka_path
	echo $kafka_path > .kafka_path
fi

echo "[INFO] Using local kafka_path = ${kafka_path}"
echo "[INFO] Using topics file: $topics_file_path"
echo 

inserted_topics=$(${kafka_path}/bin/kafka-topics.sh --list --zookeeper localhost:2181)

while read to_insert
do
	should_insert=1
	for inserted_topic in $inserted_topics
	do
		if [[ $to_insert = $inserted_topic ]]
		then
			echo "[INFO] Topic: $to_insert already inserted."
			echo "[INFO] skipping..."
			should_insert=0
		fi
	done

	if [[ $should_insert = 1 ]]
	then
		echo "[INFO] Will insert topic: $to_insert"
		echo "${kafka_path}/bin/kafka-topics.sh"
		${kafka_path}/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic $to_insert
	fi

	echo
	echo
done < $topics_file_path
