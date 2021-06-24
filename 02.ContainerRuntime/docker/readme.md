###### delete all none tag images
docker images|grep none|awk '{print $3}'|xargs docker rmi
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)