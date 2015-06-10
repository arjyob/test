#!/bin/bash
/usr/bin/aws ec2 describe-network-interfaces|grep -i ASSOCIATION |awk '{print $4}'|sort -u > /tmp/ec2ip
for i in `cat /tmp/ec2ip`
do
/opt/chefdk/embedded/bin/knife bootstrap $i --ssh-user ec2-user -i /home/ec2-user/CHEF_PAAS_DEV_KEYS.pem -N test1 --sudo
done
