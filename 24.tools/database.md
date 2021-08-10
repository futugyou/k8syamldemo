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
```