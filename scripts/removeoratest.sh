 for i in `cat ./oratestremoval`
do
ssh llnsa02 vol offline ${i}_arch 
ssh llnsa02 vol offline ${i}_ctl 
ssh llnsa02 vol offline ${i}_data
ssh llnsa02 vol offline ${i}_rft 

ssh llnsa02 vol destroy ${i}_arch -f 
ssh llnsa02 vol destroy ${i}_ctl -f 
ssh llnsa02 vol destroy ${i}_data -f 
ssh llnsa02 vol destroy ${i}_rft -f 


done

