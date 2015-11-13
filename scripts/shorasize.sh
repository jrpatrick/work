for i in `cat $1`
do
ssh llnsa02 df -h ${i}_arch  |grep -v snapshot
ssh llnsa02 df -h ${i}_ctl|grep -v snapshot 
ssh llnsa02 df -h ${i}_data|grep -v snapshot
ssh llnsa02 df -h ${i}_rft|grep -v snapshot

done

