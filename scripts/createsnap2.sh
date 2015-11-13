#!/bin/sh


vols=`ssh $2 exportfs |grep $1 |grep oraglobal | cut -d"-" -f1`

for i in $vols 
do 


ssh $3 snapmirror initialize -S $2:$i $3:$i 

done

vols=`ssh $2 exportfs |grep $1 |grep oraglobal_exp | cut -d"-" -f1`

for i in $vols
do


ssh $3 snapmirror initialize -S $2:$i $3:$i

done

vols=`ssh $2 exportfs |grep $1 |grep oraglobal_backup | cut -d"-" -f1`

for i in $vols
do


ssh $3 snapmirror initialize -S $2:$i $3:$i

done

vols=`ssh $2 exportfs |grep $1 |grep orahome | cut -d"-" -f1`

for i in $vols
do


ssh $3 snapmirror initialize -S $2:$i $3:$i

done

