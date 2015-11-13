#!/bin/sh


vols=`ssh $2 vol status -b |grep $1 | cut -d" " -f1`

for i in $vols 
do 

size=`ssh $2 vol size $i |awk {'print $8'} | cut -d. -f1`

ssh $3 vol create $i -s none aggr1 $size
ssh $3 vol restrict $i

ssh $3 snapmirror initialize -S $2:$i $3:$i 

done


