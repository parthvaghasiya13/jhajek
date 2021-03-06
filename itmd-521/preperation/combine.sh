#!/bin/bash

##################################################
# Script to combine a decade at a times txt files
##################################################
# https://www.cyberciti.biz/faq/unix-linux-iterate-over-a-variable-range-of-numbers-in-bash/

echo "Starting to append all of the year files from $1 to $2 into $3.txt"
for (( i=$1; i<=$2; i++ ))
  do
     cat $i/$i.txt >> $3.txt
  done    
  echo "Making decade directory"
  hadoop fs -mkdir -p /user/$USER/ncdc/$3/
  echo "Putting decade txt file into hadoop"
  hadoop fs -copyFromLocal ./$3.txt /user/$USER/ncdc/$3/
  echo "Making gzip file"
  gzip -kv $3.txt
  echo "putting to Hadoop Cluster"
  hadoop fs -copyFromLocal ./$3.txt.gz /user/$USER/ncdc/$3/
  rm $3.txt.gz
  echo "Making bzip2 file"
  bzip2 -zkv $3.txt
  echo "putting to Hadoop Cluster"
  hadoop fs -copyFromLocal ./$3.txt.bz /user/$USER/ncdc/$3/
  rm $3.txt.bz2

    