#!/bin/bash

FILER=$1
OFILE=/tmp/$FILER.expl

function log {
	echo "$*" >> $OFILE
}


function insbrk {
	log "***********************************************************" 
}

function bldhdr {
	log "" 
	insbrk
	log "		$1"
	insbrk
	log ""
}

bldhdr Sysconfig
ssh $FILER sysconfig >> $OFILE

bldhdr PAM Card
ssh $FILER stats show -i 1 -n 10 -p flexscale-access   >> $OFILE

bldhdr SysStat

ssh $FILER sysstat -c 10 -x 1 >> $OFILE

insbrk
ssh $FILER "priv set diag; sysstat -c 10 -M 1 ; priv set" >> $OFILE

bldhdr "FCP config / adapter"

ssh $FILER fcp config >> $OFILE
insbrk
ssh $FILER  fcp show adapter >> $OFILE

bldhdr "Interfaces"

ssh $FILER ifconfig -a >> $OFILE

bldhdr "vLANs"

ssh $FILER vlan stat >> $OFILE

bldhdr "Audit Log - Console activity"

ssh $FILER rdfile /etc/log/auditlog |grep console >> $OFILE

bldhdr "Messages Log"

ssh $FILER rdfile /etc/messages >> $OFILE


