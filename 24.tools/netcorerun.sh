image_tag=`date +%Y%m%d%H%M%S`;
echo $image_tag;

# build�����Ҵ���tag
docker build -t myapp:$image_tag .;
docker images;

# ֹͣ��ɾ���ɰ� myapp container
CID=$(docker ps | grep "myapp" | awk '{print $1}')
echo $CID
if [ "$CID" != "" ];then
  docker stop $CID
  docker rm $CID
fi

# �Ѹո�build�����ľ���������
docker run -p 5000:80 --name myapp -d myapp:$image_tag;
docker ps -a;
docker logs myapp;