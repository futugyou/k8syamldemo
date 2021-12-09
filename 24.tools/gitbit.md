### download
```
http://www.gitblit.com/
```

### edit data/defaults.properties
```
git.repositoriesFolder = d:/gitrepositoy
server.httpPort = 18765
server.httpBindInterface = 192.168.110.36
```

### run as window service, edit installService.cmd
```
SET ARCH=amd64
SET CD=D:\Program Files (x86)\gitblit-1.9.1

clean StartParams

run installService.cmd as administrator
```

### init use
```
find in data/users.conf
```