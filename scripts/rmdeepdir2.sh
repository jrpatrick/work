D=0
R=0
cd /mnt/efare1/Users/efare

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
		rm -fvr 20100219
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
