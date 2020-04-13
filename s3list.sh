#!/bin/bash
input=bucketlist
list=output
aws s3 ls | awk '{print $3}' > $input

split -l 10 -d $input $list
chunk=`ls output*`
total=0
[ -d csv ] || mkdir ./csv
for i in $chunk 
do
			./s3process.sh $i  &>> ./csv/$i.csv & 
done

