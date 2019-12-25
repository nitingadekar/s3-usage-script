# s3-usage-script
Imagine having 500+ s3 buckets and average 1Tb+ of objects size!!  
How to get per bucket utilization and to know which bucket is actually not updated since long time?  
Writing a simple script can solve the issue, but calculating utilization when you have TBs of data will definately take time. 

Here's a similar solution which provides Parallel processing of heavy buckets. Instead of processing each bucket at a time, you can parallely process many buckets simultaneously.  

Presenting a bash script which gives you bucket level usage in Mb or Gb and last updated details of each bucket in csv format  
## Prerequisites  
### You should have AWS cli installed and configured with Access key secret key/IAM role.  

For less than 30 buckets and objects less than approx 20G use s3.sh to get bucket name and utilization in stdout.  

For more than 30 buckets and data size more than approx 50Gb per bucket, follow instructions below.  
NOTE: This script will take time to execute and will create lots of garbage files.  `Cleanup.sh` script will clean the files and kill processes.   
It is recommended to create a clean directory and clone these scripts there.   
## Execute:  
```
./s3list.sh
```
Above script will create a list of buckets in `bucketlist` file.  
Will split the file in small chunks of 50 buckets per file.   
Trigger the `s3process.sh` to execute each of the above chunk file.   
#### Final artifacts will be stored in csv directory with result of each file in seperate file with respective name.   
To check if the execution is completed, check process list , if it is empty, your CSVs are ready   

```
ps awux | grep s3process.sh
```
