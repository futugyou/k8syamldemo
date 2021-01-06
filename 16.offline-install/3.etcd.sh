#!/bin/bssh
echo '解压tar包...'
tar -xvf  $1
test=${1/.tar.gz/}
echo '将etcd,etcdctl 移到/usr/bin/ 目录...'
cp $test/{etcd,etcdctl} /usr/bin/
echo 'etcd.service 移到/usr/lib/systemd/system/ 目录...'
cp etcd.service /usr/lib/systemd/system/
echo '添加文件权限...'
chmod +x /usr/lib/systemd/system/etcd.service
echo '增加etcd的存放目录'
mkdir /var/lib/etcd
echo '重新加载配置文件...'
systemctl daemon-reload
echo '设置开机自启...'
systemctl enable etcd.service
echo '命令启动etcd服务'
systemctl start etcd.service
echo '验证etcd 是否正确启动....'
etcdctl cluster-health

#DOTO: It's not finished yet.....