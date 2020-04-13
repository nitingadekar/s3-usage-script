#!/bin/bash
total=0
echo "loop start"
echo `date`
bucketname=$1
##get storage per bucket
bytes=`aws s3 ls s3://$bucketname  --recursive | awk '{print $3}'`
for byte in $bytes
    do
       total=$(($byte+$total))
    done
    echo "loopend"
    echo "BC start"
    echo `date`
totalbc=`aws s3 ls s3://$bucketname  --recursive | awk '{print $3}' | paste -sd+ | bc`
	echo `date`
        echo "BC end"
      	#convert to human values
        #human=`echo $total | human_print`
        #get last updated details 
        #last=` aws s3 ls $bucket  --recursive   | sort   | tail -n 1 |  awk '{print $1 ,"," $2 ," ," $4}'`
        ##generate CSV
echo total
echo $total
echo totalbc
echo $totalbc
