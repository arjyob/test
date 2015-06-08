#!/bin/bash
/home/arjyob/.local/lib/aws/bin/aws ec2 describe-network-interfaces|grep -i ASSOCIATION |awk '{print $4}'|sort -u > /tmp/ec2ip
for i in `cat /tmp/ec2ip`
do
/usr/bin/knife bootstrap $i
done
