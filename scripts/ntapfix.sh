date
mkdir /test/sita
mount llnsa02:/vol/vol512/efare1/Users/efare /test/sita
let i=1
cd /test/sita/20100219
while [ $i -lt 468100 ]
do
	echo $i
	cd 20100219
	mv 20100219 ../$i
cd /test/sita/20100219/
rmdir 20100219
mv $i 20100219
let i=i+1
done

umount /test/sita
rmdir /test/sita


date
