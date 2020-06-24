#!/bin/bash

echo "Injecting IP address in the config. POD_IP: ${POD_IP}"

sed -i'.bak' "s|hadoop-master\.hadoop|${POD_IP}|g" /etc/hadoop/conf/hdfs-site.xml
rm /etc/hadoop/conf/hdfs-site.xml.bak

sed -i'.bak' "s|hadoop-master\.hadoop|${POD_IP}|g" /etc/hadoop/conf/core-site.xml
rm /etc/hadoop/conf/core-site.xml.bak

sed -i'.bak' "s|hadoop-master\.hadoop|${POD_IP}|g" /etc/hadoop/conf/mapred-site.xml
rm /etc/hadoop/conf/mapred-site.xml.bak

sed -i'.bak' "s|hadoop-master\.hadoop|${POD_IP}|g" /etc/hadoop/conf/yarn-site.xml
rm /etc/hadoop/conf/yarn-site.xml.bak

supervisord -c /etc/supervisord.conf
