#!/bin/bash
list=remaining
#aws s3 ls | awk '{print $3}' > $list

split -l 20  -d $list $list
chunk=`ls remaining??`
total=0
[ -d csv ] || mkdir ./csv
for i in $chunk 
do
			./s3process.sh $i  &>> ./csv/$i.csv & 
done
