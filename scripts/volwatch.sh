#!/bin/sh

for i in `cat filers`
do
	OLDVOLLIST=/tmp/$i.old
	NEWVOLLIST=/tmp/$i.new

ssh $i vol status -b |awk {'print $1'} | grep -v "\-\-\-\-"|grep -v "Volume" > $NEWVOLLIST

OLDNUM=`cat $OLDVOLLIST |wc -l|awk {'print $1'}`
NEWNUM=`cat $NEWVOLLIST |wc -l |awk {'print $1'}`

if [ $OLDNUM -ne $NEWNUM ]
then

echo "Removed:"
diff $OLDVOLLIST $NEWVOLLIST  | grep \< |cut -d" " -f2
echo ""
echo "Added:"
diff $OLDVOLLIST $NEWVOLLIST  | grep \> |cut -d" " -f2

else

echo "$i : No Volume changes"

fi

cp -f $NEWVOLLIST $OLDVOLLIST

done
