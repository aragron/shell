#!/bin/bash
ps aux|grep redis|grep -v grep|grep -v sh|awk '{print $2}'|xargs -i kill -9 {}


rm -f /apps/conf/redis-cluster/dump.rdb
rm -f /apps/conf/redis-cluster/nodes-700*.conf
rm -f /var/run/redis_700*.pid
/usr/local/bin/redis-server /apps/conf/redis-cluster/7001/redis.conf
/usr/local/bin/redis-server /apps/conf/redis-cluster/7002/redis.conf
/usr/local/bin/redis-server /apps/conf/redis-cluster/7003/redis.conf
/usr/local/bin/redis-server /apps/conf/redis-cluster/7004/redis.conf
/usr/local/bin/redis-server /apps/conf/redis-cluster/7005/redis.conf
/usr/local/bin/redis-server /apps/conf/redis-cluster/7006/redis.conf

/root/redis-3.2.7/src/redis-trib.rb create --replicas 1 192.168.60.10:7001 192.168.60.10:7002 192.168.60.10:7003 192.168.60.10:7004 192.168.60.10:7005 192.168.60.10:7006 << EOF
yes
EOF
