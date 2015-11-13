
VOLS=`cat afpvols`

for i in $VOLS
do

	ssh llnsa02 snap list $i 
done
