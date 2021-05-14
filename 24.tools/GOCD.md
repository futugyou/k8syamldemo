##### https://www.gocd.org/download/#docker
```
docker run -d -p8153:8153 -p8154:8154 gocd/gocd-server:v21.2.0
docker run -d -e GO_SERVER_URL=http://13.72.208.153/:8154/go gocd/gocd-agent-ubuntu-18.04:v21.2.0
```