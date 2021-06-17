#!/usr/bin/env bash

# It is must be ip or fqdn
IPorFQDN=$1

echo -e 'Install Latest Stable Harbor Release'
HARBORVERSION=$(curl -s https://github.com/goharbor/harbor/releases/latest/download 2>&1 | grep -Po [0-9]+\.[0-9]+\.[0-9]+)
rm -rf harbor-online-installer-v$HARBORVERSION.tgz*
curl -s https://api.github.com/repos/goharbor/harbor/releases/latest | grep browser_download_url | grep online | cut -d '"' -f 4 | wget -qi -
tar xvf harbor-online-installer-v$HARBORVERSION.tgz
rm -rf harbor-online-installer-v$HARBORVERSION.tgz*
 
cp ./harbor/harbor.yml.tmpl ./harbor/harbor.yml
sh ./3.1.harbor-tls.sh $IPorFQDN
sed -i "s/\/your\/certificate\/path/\/etc\/docker\/certs.d\/$IPorFQDN.com\/$IPorFQDN.com.cert /g" ./harbor/harbor.yml
sed -i "s/\/your\/private\/key\/path/\/etc\/docker\/certs.d\/$IPorFQDN.com\/$IPorFQDN.com.key /g" ./harbor/harbor.yml
sed -i "s/reg.mydomain.com/$IPorFQDN/g" ./harbor/harbor.yml

./harbor/prepare
docker-compose down -v
docker-compose up -d

cd ..
## 在配置insecure-registry时，docker 必须配置服务器的 FQDN或者IP地址.不能是服务器的hostname（比如harbor）
## /usr/lib/systemd/system/docker.service
## ExecStart=/usr/bin/dockerd --insecure-registry={harbor FQDN或者IP地址}
## OR
## vi /etc/docker/daemon.json
## { "insecure-registries":["{harbor FQDN或者IP地址}"] }
