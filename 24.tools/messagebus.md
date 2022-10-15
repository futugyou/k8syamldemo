######  kafka
```
docker run -d --name zookeeper -p 2181:2181 -t wurstmeister/zookeeper
docker run -d --name kafka -p 9092:9092 -e KAFKA_BROKER_ID=0 -e KAFKA_ZOOKEEPER_CONNECT=10.0.0.4:2181 -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://10.0.0.4:9092 -e KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092 -t wurstmeister/kafka

docker exec -it 245317b191e2  /bin/bash
cd opt/kafka/bin
kafka-topics.sh --create --zookeeper 10.0.0.4:2181 --replication-factor 1 --partitions 1 --topic mykafka
kafka-console-producer.sh --broker-list localhost:9092 --topic mykafka
kafka-console-consumer.sh --bootstrap-server  localhost:9092 --topic mykafka --from-beginning
```

######  kafka docker compose
```
git clone https://github.com/conduktor/kafka-stack-docker-compose.git
docker-compose -f zk-single-kafka-single.yml up -d
```

######  rabbitmq
```
docker run -itd --hostname Terraform --name AbpEventMQ -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=password  -p 15672:15672 -p 5672:5672 rabbitmq:3-management
```

######  pulsar
```
docker run -itd -p 6650:6650 -p 8090:8080  --name pulsar -v /d/docker/data:/pulsar/data  apachepulsar/pulsar-all bin/pulsar standalone
docker run --name pulsar-dashboard -dit -p 88:80 -e SERVICE_URL=http://pulsar:8080 --link pulsar apachepulsar/pulsar-dashboard

docker exec -it pulsar bash bin/pulsar-client produce my-topic --messages "hello-pulsar"
```
