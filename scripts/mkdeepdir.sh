D=0
cd /mnt3

while [ $D -ne "$1"  ]
do
mkdir 20100219
if [ $? -eq 0 ]
then
	D=$((D + 1 ))
	echo $D >>/tmp/mkdeepdir_mnt3.out
else
	exit
fi
cd 20100219
done
