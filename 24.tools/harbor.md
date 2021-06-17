#### [Document](https://goharbor.io/docs/2.2.0/)
```
shell: /01.kubernetes-install/17.online-install/ 3.harbor.sh 3.1.harbor-tls.sh v3.ext
```

#### shell parameter $(hostname -I|cut -d" " -f 1) or $(hostname -f)

if openssl error random number generator:RAND_load_file:Cannot open file
```
run openssl rand -writerand .rnd in tip path
```

#### docker-compose should be version 3.3

#### exec to harbor db
```
psql -U postgres -h postgresql -p 5432
pwd: root123
\l                        #列出所有数据库
\c   dbname               #切换数据库
\d                        #列出当前数据库的所有表
\q                        #退出数据库
```
```
\c registry
\d
select * from harbor_user;              

update harbor_user set password='a71a7d0df981a61cbb53a97ed8d78f3e',salt='ah3fdh5b7yxepalg9z45bu8zb36sszmr' where username='admin';

update harbor_user set password='68b057f911feab84067a55fb75dfd135',salt='GQnLzX3s5t5Qyll4aJhW3QLCyJ6HuU2U' where username='admin';
```