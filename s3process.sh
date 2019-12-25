#!/bin/bash

####function to create bytes to human readable format
human_print(){
while read B dummy; do
  [ $B -lt 1024 ] && echo ${B}bytes && break
  KB=$(((B+512)/1024))
  [ $KB -lt 1024 ] && echo ${KB}kB && break
  MB=$(((KB+512)/1024))
  [ $MB -lt 1024 ] && echo ${MB}MB && break
  GB=$(((MB+512)/1024))
  [ $GB -lt 1024 ] && echo ${GB}GB && break
  echo $(((GB+512)/1024))TB
done
}

echo "Bucket Name, Storage, Last updated date , Last updated time, Last updated file"
total=0
for bucket in `cat $1`
do
##get storage per bucket
	bytes=`aws s3 ls s3://$bucket --recursive | awk '{print $3}'`
	for byte in $bytes
	do
	       total=$(($byte+$total))
	done
	#convert to human values
	human=`echo $total | human_print`
	#get last updated details 
	last=` aws s3 ls $bucket  --recursive   | sort   | tail -n 1 |  awk '{print $1 ,"," $2 ," ," $4}'`
	##generate CSV

        echo "$bucket, $human, $last"
done

