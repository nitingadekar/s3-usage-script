#!/bin/bash
total=0
##get storage per bucket
bytes=`aws s3 ls s3://nitin-script-test --recursive | awk '{print $3}'`
for byte in $bytes
    do
       total=$(($byte+$total))
    done
        #convert to human values
        #human=`echo $total | human_print`
        #get last updated details 
        #last=` aws s3 ls $bucket  --recursive   | sort   | tail -n 1 |  awk '{print $1 ,"," $2 ," ," $4}'`
        ##generate CSV

echo $total

