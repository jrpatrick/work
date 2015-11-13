#!/bin/ksh
ssh -n llnsa02 priv set advanced

for i in `cat ./volumes.dat`
do


ssh -n llnsa02 vol offline $i
ssh -n llnsa02 vol destroy $i -f

for j in `cat ./hosts.dat`

done

for j in `cat ./hosts.dat`
do
	ssh -n llnsa02 qtree remove /vol/oradata/$j_ora
	ssh -n llnsa02 qtree remove /vol/oradata/$j_home
	ssh -n llnsa02 qtree remove /vol/oradata/$j_ora


done

done

ssh -n llnsa02 priv set 

