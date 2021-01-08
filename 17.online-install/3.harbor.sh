#!/bin/bash

IPorFQDN=$1

echo -e 'Install Latest Stable Harbor Release'
HARBORVERSION=$(curl -s https://github.com/goharbor/harbor/releases/latest/download 2>&1 | grep -Po [0-9]+\.[0-9]+\.[0-9]+)
curl -s https://api.github.com/repos/goharbor/harbor/releases/latest | grep browser_download_url | grep online | cut -d '"' -f 4 | wget -qi -
tar xvf harbor-online-installer-v$HARBORVERSION.tgz
 
cp ./harbor/harbor.yml.tmpl ./harbor/harbor.yml
sh ./3.1.harbor-tls.sh $IPorFQDN
sed -i "s/\/your\/certificate\/path/\/etc\/docker\/certs.d\/$IPorFQDN.com\/$IPorFQDN.com.cert /g" ./harbor/harbor.yml
sed -i "s/\/your\/private\/key\/path/\/etc\/docker\/certs.d\/$IPorFQDN.com\/$IPorFQDN.com.key /g" ./harbor/harbor.yml
sed -i "s/reg.mydomain.com/$IPorFQDN/g" ./harbor/harbor.yml

./harbor/install.sh --with-clair --with-chartmuseum
echo -e '\033[47;31m Harbor Installation Complete \n\n \033[0m'
echo -e "Please log out and log in or run the command 'newgrp docker' to use Docker without sudo\n\n"
echo -e 'Login to your harbor instance:\n'
echo -e 'docker login -u admin -p Harbor12345 $IPorFQDN'