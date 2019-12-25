#!/bin/bash
list=bucketlist


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

aws s3 ls | awk '{print $3}' > $list
a=40
b=50

total=0
size=30k
for bucket in `cat $list`
do

	bytes=`aws s3 ls s3://$bucket --recursive | awk '{print $3}'`
	for byte in $bytes
	do
	      # echo "$byte in $bucket"	
	       total=$(($byte+$total))	
	done
	#mb=$((total/1023/1024))
	human=`echo $total | human_print`
        echo $bucket $human
	#echo -e " $total\t$bucket "
	#$echo $bucket
done
