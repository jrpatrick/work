
function findvolsize {

ssh $1 vol size $2

}

function crvol {
ssh $1 vol create $2 -s none aggr1 $3
ssh $1 vol restrict $2

}

# controller to ssh to, src filer, dst filer, src vol, dst vol
function cpvol {
ssh $1 vol copy start $2:$4 $3:$5
}

function offvol {
ssh $1 vol offline $2
}

for i in `cat ./oramed.parm`
do

ARCHSZ=`findvolsize llnsa01  ${i}_arch |cut -d " " -f8 | cut -d. -f1`
CTLSZ=`findvolsize llnsa01  ${i}_ctl |cut -d " " -f8 | cut -d. -f1`
DATASZ=`findvolsize llnsa01  ${i}_data |cut -d " " -f8 | cut -d. -f1`
RFTSZ=`findvolsize llnsa01  ${i}_rft |cut -d " " -f8 | cut -d. -f1`

crvol llnsa02 ${i}_arch $ARCHSZ
crvol llnsa02 ${i}_ctl $CTLSZ
crvol llnsa02 ${i}_data $DATASZ
crvol llnsa02 ${i}_rft $RFTSZ

cpvol llnsa01 llnsa01 llnsa02 ${i}_arch ${i}_arch
cpvol llnsa01 llnsa01 llnsa02 ${i}_ctl ${i}_ctl
cpvol llnsa01 llnsa01 llnsa02 ${i}_data ${i}_data
cpvol llnsa01 llnsa01 llnsa02 ${i}_rft ${i}_rft

offvol llnsa01 ${i}_arch 
offvol llnsa01 ${i}_ctl 
offvol llnsa01 ${i}_data
offvol llnsa01 ${i}_rft


done

#for j in `cat ./oramed`
#do

#ssh llnsa02 vol size ${j}_arch 13g
#ssh llnsa02 vol size ${j}_ctl 13g
#ssh llnsa02 vol size ${j}_data 25g
#ssh llnsa02 vol size ${j}_rft 26g
#
#done

#for k in `cat ./oralg`
#do

#ssh llnsa02 vol size ${k}_arch 32g
#ssh llnsa02 vol size ${k}_ctl 13g
#ssh llnsa02 vol size ${k}_data 50g
#ssh llnsa02 vol size ${k}_rft 32g
#
#done

