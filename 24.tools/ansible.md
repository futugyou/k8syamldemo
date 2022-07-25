#### cnetos install Ansible
```
yum install epel-release -y
yum install ansible -y
```
### ssh
```
ssh-keygen -t rsa -b 4096 
ssh-copy-id master01
```

#### add group (eg. master01)
```
vi /etc/ansible/hosts 
ansible all -m ping
ansible {group-name} -m ping
ansible all -a "/bin/echo hello"
```
#### install Tower 
```
cd /opt
wget http://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-latest.tar.gz
tar -xf ansible-tower-setup-latest.tar.gz
rm -rf ansible-tower-setup-latest.tar.gz

vi  /opt/ansible-tower-setup-3.8.3-1/inventory
admin_password='admin' 
pg_username='admin'
pg_password='admin

yum -y install  postgresql
mkdir /tmp/tower && mkdir -p /var/log/tower

yum install -y supervisor
systemctl enable supervisord
systemctl start supervisord

/opt/ansible-tower-setup-3.8.3-1/setup.sh
touch /var/lib/awx/i18n.db && ansible-tower-service restart
```

##### login
```
https://localhost/#/login
```