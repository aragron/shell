#!/bin/bash
RepositoryURL=$1
Branch=$2
ProjectName_tmp=${RepositoryURL##*/}
ProjectName=${ProjectName_tmp%\.*}
echo $ProjectName
echo $Branch

nowPath=`pwd`
echo $nowPath
rm -fr $nowPath/*
ls
git clone -b $Branch $RepositoryURL
cd $ProjectName
sleep 1
git checkout -b master origin/master
sleep 1
git checkout $Branch
sleep 1
git merge master
sleep 1
pwd
#git add .
#git commit -m "merge master to branch"
#git push $RepositoryURL $ProjectName
ls
git push origin $Branch
mv ./* .. && cd .. && rm -fr $ProjectName
