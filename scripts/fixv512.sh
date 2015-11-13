rm /tmp/fixvol512.out
date >/tmp/fixvol512.out
ssh llnsa02 vol create vol512_new -s none aggr2 330g 
sleep 1
ssh llnsa02 ndmpcopy -exclude "/vol/vol512/efare1/Users/efare/20100219/*" llnsa02:/vol/vol512 llnsa02:/vol/vol512_new  
date  >>/tmp/fixvol512.out

