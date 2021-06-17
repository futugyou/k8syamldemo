#!/usr/bin/env bash

image_tag=`date +%Y%m%d%H%M%S`;
echo $image_tag;

# build镜像并且打上tag
docker build -t myapp:$image_tag .;
docker images;

# 停止并删除旧版 myapp container
CID=$(docker ps | grep "myapp" | awk '{print $1}')
echo $CID
if [ "$CID" != "" ];then
  docker stop $CID
  docker rm $CID
fi

# 把刚刚build出来的镜像跑起来
docker run -p 5000:80 --name myapp -d myapp:$image_tag;
docker ps -a;
docker logs myapp;