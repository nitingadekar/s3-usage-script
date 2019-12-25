#!/bin/bash

pkill s3process.sh
rm bucketlist*
rm s3task*
read -n1 -p "You really want to delete the csv? [y,n]" delete
case $delete in  
  y|Y) rm -rf csv && echo -e "\n deleted csv folder" ;; 
  n|N) echo -e "\ncsv preserved" ;; 
  *) echo -e  "\n terminating" ;; 
esac
