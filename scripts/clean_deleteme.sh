#!/bin/sh



LLNSA02_VOL=`ssh llnsa02 vol status -b |grep -i delete|awk {'print $1'}`

for i in $LLNSA02_VOL 
do 
	ssh llnsa02 vol offline $i 
	ssh llnsa02 vol destroy $i -f 
done

LLNSA01_VOL=`ssh llnsa01 vol status -b |grep -i delete|awk {'print $1'}`

for i in $LLNSA01_VOL
do
        ssh llnsa01 vol offline $i
        ssh llnsa01 vol destroy $i -f
done

LLNSA02_QTREE=`ssh llnsa02 qtree status | grep -i delete |awk {'print $1"/"$2'}`

for j in $LLNSA02_QTREE
do
	ssh llnsa02 exportfs -z /vol/$j
	ssh llnsa02 "priv set advanced; qtree delete -f /vol/$j" 
done

LLNSA01_QTREE=`ssh llnsa01 qtree status | grep -i delete |awk {'print $1"/"$2'}`

for j in $LLNSA01_QTREE
do
        ssh llnsa01 exportfs -z /vol/$j
        ssh llnsa01 "priv set advanced; qtree delete -f /vol/$j"
done

LLNSA02_EXPORT=`ssh llnsa02 exportfs |grep -i delete |awk {'print $1'}`

for k in $LLNSA02_EXPORT
do
        ssh llnsa02 exportfs -z $k
done

LLNSA01_EXPORT=`ssh llnsa01 exportfs |grep -i delete |awk {'print $1'}`

for k in $LLNSA01_EXPORT
do
        ssh llnsa01 exportfs -z $k
done

