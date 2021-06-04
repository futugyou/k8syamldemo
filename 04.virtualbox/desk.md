###### add new desk in virtual box, then
```
#check sdb
lsblk
#get desk use
df -h
#get desk No
ls /dev/sd*
# create pv
pvcreate /dev/sdb
# get vg group
vgs
# upgrade vg
vgextend {vg-name} /dev/sdb
# check lv
lvs
# extend lv
lvextend -L +99.9G /dev/mapper/{vg-name}-root
# reload 
xfs_growfs /dev/mapper/{vg-name}-root
# show result
df -h
```