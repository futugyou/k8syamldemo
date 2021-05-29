#!/bin/bash

sh ./0.housekeeping.sh

echo -e '\033[47;31m prepare docker and harbor \033[0m'
PS3='Would you like to install Harbor based on IP or FQDN? '
select option in IP FQDN
do
    case $option in
        IP)
            IPorFQDN=$(hostname -I|cut -d" " -f 1)
            break;;
        FQDN)
            IPorFQDN=$(hostname -f)
            break;;
     esac
done

sh ./1.docker-install.sh $IPorFQDN

sh ./2.docker-compose-install

sh ./3.harbor.sh $IPorFQDN

sh ./4.cfssl.sh
sh ./5.createCA.sh
sh ./6.kubernetes-csr.sh
sh ./7.admin-csr.sh
sh ./8.kube-proxy-csr.sh

sh ./9.kubelet.1.20.sh