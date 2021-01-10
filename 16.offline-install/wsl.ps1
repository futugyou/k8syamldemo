wsl --set-default-version 2
wsl --list --verbose
wsl --set-version Ubuntu-20.04 2
#wsl --unregister Ubuntu-20.04
#https://github.com/DDoSolitary/LxRunOffline/releases
LxRunOffline.exe list
# wsl --shutdown Ubuntu-20.04
# LxRunOffline.exe move -n Ubuntu-20.04 -d E:\wsl

/etc/wsl.conf

[network]
generateHosts = false
#fixed ip
sudo vi /etc/hosts