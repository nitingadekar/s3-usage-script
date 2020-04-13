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

#echo "Bucket Name, Storage, Last updated date , Last updated time, Last updated file"

for bucket in `cat $1`
do
##get storage per bucket
	total=0
	total=`aws s3 ls s3://$bucket  --recursive | awk '{print $3}' | paste -sd+ | bc`
	#convert to human values
	#human=`echo $total` # dont want human readable as cant convert in one unit if want formating in excel 
	
	#get last updated details 
	#last=` aws s3 ls $bucket  --recursive   | sort   | tail -n 1 |  awk '{print $1 ,"," $2 ," ," $4}'`  # commented as sort takes lots of memory and entire list is truncated. 

	##generate CSV
        # echo "$bucket, $total, $last"   #commented if #last is commented
	
	#without last updated details
        echo "$bucket, $total"
done

