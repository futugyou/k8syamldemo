#!/bin/bash
echo 'install daemonize'
apt update
apt install daemonize
daemonize /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --system-unit=basic.target
echo 'exec'
exec sudo  nsenter -t $(pidof systemd) -a su - $LOGNAME