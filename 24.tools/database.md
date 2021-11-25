### mariadb
```
docker run -p 127.0.0.1:3306:3306  --name  mariadb -e MYSQL_ROOT_PASSWORD=123456 -d mariadb  --lower_case_table_names=1
/etc/mysql# vim mariadb.cnf
```

### check version
```
docker exec -it mariadb /bin/bash
mysql -uroot -p123456
```

### postgres
```
docker run --name my_postgres -v dv_pgdata:/var/lib/postgresql/data -e POSTGRES_PASSWORD=123456 -p 5432:5432 -d postgres
docker run -d -p 5433:80 --name pgadmin4 -e PGADMIN_DEFAULT_EMAIL=test@123.com -e PGADMIN_DEFAULT_PASSWORD=123456 dpage/pgadmin4
```

### redis
```
docker run --name my-redis -d   -p 6379:6379  -v /docker/host/dir:/data redis 
```

### mongodb
```
docker run --name mongodb -d -p 27017:27017 -v //d/docker/:/data/db  -e MONGO_INITDB_ROOT_USERNAME=test -e MONGO_INITDB_ROOT_PASSWORD=123456 mongo
```