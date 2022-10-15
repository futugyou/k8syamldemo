### [official doc](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-compose-file)

####### https://www.cnblogs.com/huaweiyun/p/14870066.html

```
kubectl -s http://ip:port create -f es-master.yaml
kubectl -s http://ip:port create -f es-data.yaml
kubectl -s http://ip:port create -f es-service.yaml
```

####### ES-head Component
```
https://github.com/mobz/elasticsearch-head
```

####### Cerebro��kopf��Component
```
https://github.com/lmenezes/cerebro
```
####### es command
```
GET _cluster/health
{
  "cluster_name": "es",
  "status": "green",
  "timed_out": false,
  "number_of_nodes": 15,
  "number_of_data_nodes": 12,
  "active_primary_shards": 2176,
  "active_shards": 4347,
  "relocating_shards": 0,
  "initializing_shards": 0,
  "unassigned_shards": 0,
  "delayed_unassigned_shards": 0,
  "number_of_pending_tasks": 0,
  "number_of_in_flight_fetch": 0,
  "task_max_waiting_in_queue_millis": 0,
  "active_shards_percent_as_number": 100
}

GET /_cat/pending_tasks

GET _cluster/allocation/explain

GET /_cat/indices?v&health=red

curl -s http://ip:port/_cat/shards | grep UNASSIGNED

POST _cluster/reroute?pretty" -d '{
    "commands" : [
        {
          "allocate_stale_primary" : {
              "index" : "xxx",
              "shard" : 1,
              "node" : "12345...",
              "accept_data_loss": true
          }
        }
    ]
}

PUT /szv_ingress_*/settings
{
  "index": {
    "number_of_replicas": 1
  }
}
```