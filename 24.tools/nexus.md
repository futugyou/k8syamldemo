```
docker run -d  -p 8080:80 --name mynuget -v $PWD/nuget/db:/var/www/db -v $PWD/nuget/packages:/var/www/packagefiles -e NUGET_API_KEY=ee28314c-f7fe-2550-bd77-e09eda3d0119  sunside/simple-nuget-server

docker run -d -p 8081:8081 --name nexus -v /d/docker/sonatype-work/:/sonatype-work/ --restart=always sonatype/nexus3
docker exec -it caa2636591ac /bin/bash
cat nexus-data/admin.password
http://IP:8081
http://IP:8081/#admin/security/realms Add nuget
http://IP:8081/#user/nugetapitoken
 

nuget setapikey a577cf41-2257-361e-b8d0-6a8fe6ea6ae3 -source http://IP:8081/repository/nuget-hosted/ 

nuget push -Source http://IP:8081/repository/nuget-hosted/ -ApiKey a577cf41-2257-361e-b8d0-6a8fe6ea6ae3  Common.1.0.0.nupkg 
```