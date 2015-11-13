#!/bin/sh


VOLS=`ssh $1 vol status -b  |awk {'print $1'} |grep -v oraglobal`

for i in $VOLS
do

 	SNAP=`ssh $1 snap list $i |grep llnsa |cut -d" " -f16,17`
	for j in $SNAP
	do
		ssh $1 snap delete $i $j
	done

done
