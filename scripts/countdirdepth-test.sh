D=0
cd /tmp/test

while [ true  ]
do
cd test
if [ $? -eq 0 ]
then
	D=$((D + 1 ))
	echo $D >>/tmp/dirdepthtest.out
else
	exit
fi
sleep 1
done
echo $D
