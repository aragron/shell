#!/bin/bash
backup_filename=jenkins_pro.`date +%Y%m%d`.tar.gz
rm -fr /tmp/jenkins_pro
for i in `ls /home/apps/.jenkins/jobs/`;do mkdir -p /tmp/jenkins_pro/$i;done
for i in `ls /home/apps/.jenkins/jobs/`;do cp /home/apps/.jenkins/jobs/$i/config.xml /tmp/jenkins_pro/$i;done
cd /tmp && tar -zcf $backup_filename jenkins_pro
ansible jenkins2 -m copy -a "src=/tmp/$backup_filename dest=/apps/backup"
cp /tmp/$backup_filename /apps/backup
