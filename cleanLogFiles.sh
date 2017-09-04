#!/bin/bash

function cleanLogFiles() {
	
	date +%Y%m%d >> /tmp/cleanLogsFile.log

	echo "开始删除文件：" >> /tmp/cleanLogsFile.log
	for LogFile in `find $LogDirs'/'* -type f -atime +1` #注意是atime
	do
		rm -f $LogFile
		echo "delete file: $LogFile" >> /tmp/cleanLogsFile.log
	done

	echo '-------------------------------------------------'

	echo "开始清零文件：" >> /tmp/cleanLogsFile.log
	for LogFile in `ls $LogDirs`
	do
		echo '' > $LogDirs/$LogFile
		echo "clean file: $LogDirs/$LogFile" >> /tmp/cleanLogsFile.log
	done

	echo '*************************************************'
}


dirs=()
for i in `ls /apps/svr/tomcat_mall/ |grep apache-tomcat`
do
	dirs=(${dirs[*]} /apps/svr/tomcat_mall/$i/logs)
done

for i in `ls /apps/svr/logs/`
do
	dirs=(${dirs[*]} /apps/svr/logs/$i)
done



for LogDirs in ${dirs[@]}
do
 cleanLogFiles 
done

#echo ${dirs[@]}

###################################################################
date +%Y%m%d >> /tmp/cleanLogsFile.log
for i in `ls /apps/svr/tomcat_mall`
do
        for j in `ls /apps/svr/tomcat_mall/$i|grep ".log$"`
        do
                echo '' > /apps/svr/tomcat_mall/$i/$j
        done
        for k in `ls /apps/svr/tomcat_mall/$i|grep ".out$"`
        do
                echo '' > /apps/svr/tomcat_mall/$i/$k
        done
done

for i in `find /apps/ -name nohup.out`
do
        echo '' > $i
done
###################################################################
for i in `find /var/log/ -type f |grep 20`;do rm -f $i;done
