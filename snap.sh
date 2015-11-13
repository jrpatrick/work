#!/bin/sh

LLNSA03_VOLS="VMNFS_management_2"
LLNSA04_VOLS="insvm_orchapp pamxs001d_data pamxs001d_fra pamxs001d_eb orahome oraglobal pamxs002d_fra pamxs002d_data pamxs002d_eb pamxs003d_fra pamxs003d_data pamxs003d_eb"

for i in $LLNSA03_VOLS
do
	ssh llnsa03 snap create $i snap.itpam.preupgrade

done

for j in $LLNSA04_VOLS
do
	ssh llnsa04 snap create $j snap.itpam.preupgrade
done
