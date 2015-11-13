D=0
cd /mnt/efare1/Users/efare

while [ true  ]
do
cd 20100219
if [ $? -eq 0 ]
then
	D=$((D + 1 ))
	echo $D >>/tmp/dirdepth.out
else
	exit
fi
done
echo $D
