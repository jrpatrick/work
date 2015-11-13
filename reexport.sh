#!/bin/sh

TMPFILE=/tmp/efile
ssh $2 exportfs |grep $1 | awk {'print $1,$2'} |sed s/" "//g> $TMPFILE

for i in `cat $TMPFILE`
do

path=`echo $i | cut -d"-" -f1`
opt=`echo $i | cut -d"-" -f2 `

ssh $3 exportfs -p $opt  $path  

done


