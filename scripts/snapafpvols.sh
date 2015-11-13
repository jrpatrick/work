
VOLS=`cat afpvols`

for i in $VOLS
do

	ssh llnsa02 snap create $i snap.presp3.12install
done
