##### install kong
```
docker pull kong/kong-gateway:2.3.3.2-alpine
docker tag d9ca90560d67 kong-ee
docker network create kong-ee-net
```

##### install consul
```
docker run  -d --name=dev-consul1 --network=host -e CONSUL_BIND_INTERFACE=eth0 consul:1.8
```

##### install postgresSql 9.6
```
docker run -d --name kong-ee-database \
  --network=kong-ee-net \
  -p 5432:5432 \
  -e "POSTGRES_USER=kong" \
  -e "POSTGRES_DB=kong" \
  -e "POSTGRES_PASSWORD=kong" \
  postgres:9.6
```

```
docker run --rm \
    --network=kong-ee-net \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST=kong-ee-database" \
    -e "KONG_PG_USER=kong" \
    -e "KONG_PG_PASSWORD=kong" \
    kong-ee kong migrations bootstrap
```

##### Run kong
```
 docker run -d --name kong-ee2 \
  --network=kong-ee-net \
  -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_HOST=kong-ee-database" \
  -e "KONG_PG_PASSWORD=kong" \
  -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
  -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
  -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
  -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
  -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" \
  -e "KONG_ADMIN_GUI_URL=http://52.230.46.84:8002" \
  -e "DNS_RESOLVER=172.18.0.1:8600" \
  -p 8000:8000 \
  -p 8443:8443 \
  -p 8001:8001 \
  -p 8444:8444 \
  -p 8002:8002 \
  -p 8445:8445 \
  -p 8003:8003 \
  -p 8004:8004 \
  kong-ee
  
  
  //-e "KONG_DNS_RESOLVER=172.16.1.30:8600" 注意这个配置，这是我需要用的consul的dns配置，如果不想用consul做服务发现，删掉这行
 ```

