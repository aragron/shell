#!/bin/bash
BASEDIR="/home/apps/sonatype-work/nexus/storage/snapshots/cn/healthmall/"
cd $BASEDIR
for i in `ls |grep "^shop-"`
do
	if [ -d $i ];then
		cd $i
		for j in `ls`
			do
			if [ -d $j ];then
				cd $j #&& ls
				pwd
				for k in `find . -mtime +3|grep shop`;do rm -f $k;done
				cd $BASEDIR && cd $i
			fi
			done
		cd $BASEDIR
	fi
done
