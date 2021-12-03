### mariadb
```
docker run -p 192.168.110.36:3306:3306 -h 192.168.110.36  --name  mariadb -e MYSQL_ROOT_PASSWORD=123456  -v //d/docker/mariadb/data:/var/lib/mysql   -d mariadb  --lower_case_table_names=1
/etc/mysql# vim mariadb.cnf
```

### mysql
```
docker run -p 3306:3306 --name mysql -v //d/docker/mysql/conf:/etc/mysql -v //d/docker/mysql/logs:/var/log/mysql -v //d/docker/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql

docker run -itd --name=mysql -v //d/docker/mysql/conf:/etc/mysql -v //d/docker/mysql/conf/my.cnf:/etc/mysql/my.cnf -v //d/docker/mysql/logs:/var/log/mysql -v //d/docker/mysql/data:/var/lib/mysql  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql
```

### mssql
```
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Pass@w0rd" -p 51433:1433 --name mssql -h mssql -d mcr.microsoft.com/mssql/server:latest
docker exec -it mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Pass@w0rd -Q 'ALTER LOGIN SA WITH PASSWORD=NewPass@w0rd'
docker exec -it mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Pass@w0rd
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