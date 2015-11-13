#!/bin/sh

TMPFILE=/tmp/fix.$$
CHARFILE=/tmp/char.$$
ssh llnsa02 exportfs |grep ora2 |grep -v oraglobal |cut -d\- -f1 >$TMPFILE

for i in `cat $TMPFILE`
	do
	echo $i > $CHARFILE
	v=0
	while read -n 1 c 
		do
		if [ "$c" == '/' ]
		then
			v=`expr $v + 1`
		fi
	done < $CHARFILE
		
	if [ "$v" -eq "2" ]
	then
	
	echo "ssh llnsa02 exportfs -z $i" >>/tmp/output

	fi

done

rm $TMPFILE
rm $CHARFILE
