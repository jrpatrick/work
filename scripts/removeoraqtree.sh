
#for i in `cat ./oratestremoval`
#do

#QREMOVE=`ssh llnsa02 qtree status |grep $i |awk {'print $1,$2'} |cut -d" " -f2`
APP=`ssh llnsa02  qtree status |grep oraglobal | grep swb00 | grep -v swb001 |grep -v swb002 |grep -v swb003 |grep -v swb004 |grep -v swb005 |grep -v swb006 |awk {'print $1,$2'} |cut -d" " -f2`

for j in `echo $APP`
do
if [ $j != "" ]
then
ssh llnsa02 "priv set advanced; qtree delete -f /vol/oraglobal/$j"
fi

done

