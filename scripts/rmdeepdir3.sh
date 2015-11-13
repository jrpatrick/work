D=0
R=0

rm /tmp/rmdeepdir.rmd 2>/dev/null
rm /tmp/rmdeepdir.out
cd /mnt3

while [ true  ]
do
cd 20100219
if [ $? -eq 0 ]
then
	D=$((D + 1 ))
	echo $D >>/tmp/rmdeepdir.out
else
	while [ true ]
	do
		cd ..
		rmdir ./20100219
		if [ $? -eq 0 ]
		then
			R=$((R +1))
			echo $R >>/tmp/rmdeepdir.rmd
		else
			exit
	fi
	done
fi
done
