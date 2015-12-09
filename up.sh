clear

echo "[INFO] docker-compose up zookeeper"
docker-compose up zookeeper > /dev/null 2>&1 &
sleep 15
echo "[INFO] Done!"

echo "[INFO] docker-compose up kafka"
docker-compose up kafka > /dev/null 2>&1 &
sleep 15
echo "[INFO] Done!"

echo "[INFO] ./create_topics.sh" 
./create_topics.sh &
sleep 30
echo "[INFO] Done!"

echo "[INFO] docker-compose up postgres"
docker-compose up postgres &
sleep 30
echo "[INFO] Done!"

echo "[INFO] docker-compose up postgres_setup"
docker-compose up postgres_setup
echo "[INFO] Done!"

echo "[INFO] docker-compose up"
docker-compose up 
