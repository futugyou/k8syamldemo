###### install with docker  https://grafana.com/docs/loki/latest/installation/docker/
``` 
wget https://raw.githubusercontent.com/grafana/loki/v2.2.0/cmd/loki/loki-local-config.yaml -O loki-config.yaml
docker run -v /d/docker/loki:/mnt/config -p 3100:3100 grafana/loki:2.2.0 -config.file=/mnt/config/loki-config.yaml
wget https://raw.githubusercontent.com/grafana/loki/v2.2.0/cmd/promtail/promtail-docker-config.yaml -O promtail-config.yaml
docker run -v /d/docker/loki:/mnt/config -v /var/log:/var/log grafana/promtail:2.2.0 -config.file=/mnt/config/promtail-config.yaml
```


###### install with docker-compose   
```
wget https://raw.githubusercontent.com/grafana/loki/v2.2.0/production/docker-compose.yaml -O docker-compose.yaml
docker-compose -f docker-compose.yaml up
```

####### Use
Open Grafana, Configuration -> Data Sources -> Add Data Source -> Loki
```
```