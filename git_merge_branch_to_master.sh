#!/bin/bash
RepositoryURL=$1
Branch=$2
ProjectName_tmp=${RepositoryURL##*/}
ProjectName=${ProjectName_tmp%\.*}
echo $ProjectName
echo $Branch

nowPath=`pwd`
rm -fr $nowPath/*
ls
git clone $RepositoryURL
cd $ProjectName
sleep 1
git checkout -b $Branch origin/$Branch
sleep 1
git checkout master
sleep 1
git merge $Branch
sleep 1
git tag -a $(date "+%Y%m%d%H%M%S") -m "prod merge to master"
git push origin master --tags
