3. Steps for Setup
Plugins for Kafka Connect:

Download the MongoDB Source Connector and Redis Sink Connector JAR files.
Place them in the connect-plugins directory (relative to your docker-compose.yml).
Start Containers:


Use curl or a REST client to add the connectors

curl -X POST -H "Content-Type: application/json" --data @mongo-source.json http://localhost:8083/connectors
curl -X POST -H "Content-Type: application/json" --data @redis-sink.json http://localhost:8083/connectors


Check Redis:
docker exec -it <redis-container-id> redis-cli

keys *
get mycollection:1



Monitor and Debug
docker logs <kafka-connect-container-id>
curl http://localhost:8083/connectors
