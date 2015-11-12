clear

echo "[INFO] docker-compose up zookeeper"
docker-compose up zookeeper > /dev/null 2>&1 &
sleep 15
echo "[INFO] Done!"

echo "[INFO] docker-compose up kafka"
docker-compose up kafka > /dev/null 2>&1 &
sleep 15
echo "[INFO] Done!"

echo "[INFO] ./create_topics.sh" &
./create_topics.sh
sleep 15
echo "[INFO] Done!"


echo "[INFO] docker-compose up"
docker-compose up 
