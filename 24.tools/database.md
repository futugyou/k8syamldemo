###### mariadb
```
docker run -p 127.0.0.1:3306:3306  --name  mariadb -e MYSQL_ROOT_PASSWORD=123456 -d mariadb
```

###### check version
```
docker exec -it mariadb /bin/bash
mysql -uroot -p123456
```
