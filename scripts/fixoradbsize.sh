 for i in `cat ./orasm`
do
ssh llnsa02 vol size ${i}_arch 7g
ssh llnsa02 vol size ${i}_ctl 13g
ssh llnsa02 vol size ${i}_data 13g
ssh llnsa02 vol size ${i}_rft 13g

done

for j in `cat ./oramed`
do

ssh llnsa02 vol size ${j}_arch 13g
ssh llnsa02 vol size ${j}_ctl 13g
ssh llnsa02 vol size ${j}_data 25g
ssh llnsa02 vol size ${j}_rft 26g

done

for k in `cat ./oralg`
do

ssh llnsa02 vol size ${k}_arch 32g
ssh llnsa02 vol size ${k}_ctl 13g
ssh llnsa02 vol size ${k}_data 50g
ssh llnsa02 vol size ${k}_rft 32g

done


