#!/usr/bin/env bash
echo 'install daemonize'
apt update
apt install -yqq fontconfig daemonize
sudo daemonize /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --system-unit=basic.target
exec sudo  nsenter -t $(pidof systemd) -a su - $LOGNAME

cat > /etc/wsl.conf <<EOF
[network]
generateHosts = false
EOF 

# fixed ip
# sudo vi /etc/hosts

#####  about close swap 
#####  look https://docs.microsoft.com/en-us/windows/wsl/release-notes ,
#####  search "%UserProfile%\.wslconfig", then you will know how to write this is .wslconfig