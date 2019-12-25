#!/bin/bash
list=bucketlist
aws s3 ls | awk '{print $3}' > $list

split -l 50 -d $list $list
chunk=`ls bucketlist??`
total=0
[ -d csv ] || mkdir ./csv
for i in $chunk 
do
			./s3process.sh $i  &>> ./csv/$i.csv & 
done
