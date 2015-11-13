declare -i D

D=0
echo -n  "/mnt3" > /tmp/longpath

while [ $D -ne "468172"  ]
do
	echo -n "/20100219" >>/tmp/longpath

	D=$D+1

done
#echo -n " /mnt2" >>/tmp/longpath
#cd `cat /tmp/longpath`
