
for i in `cat /tmp/tux`
do

IP=`nslookup $i.atlis.sita.aero |grep -i address |grep -v \# |cut -d: -f2 |awk {'print $1'}`

echo $IP
done
