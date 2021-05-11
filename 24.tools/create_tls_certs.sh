#���� Docker TLS ֤��
#!/bin/bash

#���������Ϣ
SERVER="192.168.33.76"
PASSWORD="123546"
COUNTRY="CN"
STATE="state"
CITY="city"
ORGANIZATION="somename"
ORGANIZATIONAL_UNIT="Dev"
EMAIL="some@mail.com"

###��ʼ�����ļ�###
echo "��ʼ�����ļ�"

#�л���������Կ��Ŀ¼
cd /etc/docker   
#����ca˽Կ(ʹ��aes256����)
openssl genrsa -aes256 -passout pass:$PASSWORD  -out ca-key.pem 2048
#����ca֤�飬��д������Ϣ
openssl req -new -x509 -passin "pass:$PASSWORD" -days 3650 -key ca-key.pem -sha256 -out ca.pem -subj "/C=$COUNTRY/ST=$STATE/L=$CITY/O=$ORGANIZATION/OU=$ORGANIZATIONAL_UNIT/CN=$SERVER/emailAddress=$EMAIL"

#����server֤��˽Կ�ļ�
openssl genrsa -out server-key.pem 2048
#����server֤�������ļ�
openssl req -subj "/CN=$SERVER" -new -key server-key.pem -out server.csr
#ʹ��CA֤�鼰CA��Կ�Լ������server֤�������ļ�����ǩ��������server��ǩ֤��
openssl x509 -req -days 3650 -in server.csr -CA ca.pem -CAkey ca-key.pem -passin "pass:$PASSWORD" -CAcreateserial  -out server-cert.pem

#����client֤��RSA˽Կ�ļ�
openssl genrsa -out key.pem 2048
#����client֤�������ļ�
openssl req -subj '/CN=client' -new -key key.pem -out client.csr

sh -c 'echo "extendedKeyUsage=clientAuth" > extfile.cnf'
#����client��ǩ֤�飨���������client˽Կ�ļ���client֤�������ļ����ɣ�
openssl x509 -req -days 3650 -in client.csr -CA ca.pem -CAkey ca-key.pem  -passin "pass:$PASSWORD" -CAcreateserial -out cert.pem  -extfile extfile.cnf

#������ԿȨ��
chmod 0400 ca-key.pem key.pem server-key.pem
#������ԿȨ��
chmod 0444 ca.pem server-cert.pem cert.pem
#ɾ�������ļ�
rm client.csr server.csr

echo "�����ļ����"
###���ɽ���###