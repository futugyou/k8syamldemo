#### [install with docker](https://grafana.com/docs/loki/latest/installation/docker/)
``` 
# user/pass admin/admin
docker run -d --name=grafana -p 3000:3000 grafana/grafana:latest
wget https://raw.githubusercontent.com/grafana/loki/v2.2.1/cmd/loki/loki-local-config.yaml -O loki-config.yaml
docker run -v /d/docker/loki:/mnt/config -p 3100:3100  -d  grafana/loki:2.2.1 -config.file=/mnt/config/loki-config.yaml
wget https://raw.githubusercontent.com/grafana/loki/v2.2.1/cmd/promtail/promtail-docker-config.yaml -O promtail-config.yaml
docker run -v /d/docker/loki:/mnt/config -v /var/log:/var/log  -d grafana/promtail:2.2.1 -config.file=/mnt/config/promtail-config.yaml
```


#### install with docker-compose   
```
wget https://raw.githubusercontent.com/grafana/loki/v2.2.1/production/docker-compose.yaml -O docker-compose.yaml
docker-compose -f docker-compose.yaml up
```

#### Use
Open Grafana, Configuration -> Data Sources -> Add Data Source -> Loki



#### [install with Helm](https://grafana.com/docs/loki/latest/installation/helm/)
``` 
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm upgrade --install loki grafana/loki-stack --namespace=animal  --set grafana.enabled=true,prometheus.enabled=true,prometheus.alertmanager.persistentVolume.enabled=false,prometheus.server.persistentVolume.enabled=false
#helm upgrade --install loki-grafana grafana/grafana --namespace=animal 
kubectl get secret --namespace animal loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
nFjugLw0q5qSHkR66mGP5bz3duWAQuRC2YkYVtRy
kubectl port-forward --namespace animal --address 192.168.15.136  service/loki-grafana 3000:80
```
<span style="color:green">add --address can access form outside of cluster</span>.