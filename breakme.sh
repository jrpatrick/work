#!/bin/sh

breakme=`ssh $2 snapmirror status | grep $1  | awk {'print $1'} | cut -d: -f2`

  for i in $breakme
do 
ssh $3 snapmirror quiesce \"$3:$i \"
ssh $3 snapmirror break \"$3:$i \" 
ssh $2 snapmirror release $i \"$3:$i \"
done

