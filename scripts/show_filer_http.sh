#!/bin/sh

TMP01=/tmp/llnsa01.netstat
TMP02=/tmp/llnsa02.netstat

while true
do
	ssh llnsa02 netstat -an >$TMP02
	ssh llnsa01 netstat -an >$TMP01

	NSA01_443=`cat $TMP01 | grep \.443 | wc -l |awk {'print $1'}`
	NSA02_443=`cat $TMP02 | grep \.443 | wc -l |awk {'print $1'}`

	NSA01_80=`cat $TMP01 | grep \.80 | wc -l |awk {'print $1'}`
	NSA02_80=`cat $TMP02 | grep \.80 | wc -l |awk {'print $1'}`

	NSA01_443_EST=`cat $TMP01 | grep \.443 | grep EST |wc -l |awk {'print $1'}`
	NSA02_443_EST=`cat $TMP02 | grep \.443 | grep EST |wc -l |awk {'print $1'}`

	NSA01_80_EST=`cat $TMP01 | grep \.80 | grep EST |wc -l |awk {'print $1'}`
	NSA02_80_EST=`cat $TMP02 | grep \.80 | grep EST |wc -l |awk {'print $1'}`

	NSA01_WFA=`cat $TMP01 | grep 10\.5\.51\.93  |wc -l |awk {'print $1'}`
	NSA02_WFA=`cat $TMP02 | grep 10\.5\.51\.93  |wc -l |awk {'print $1'}`

	NSA01_WFA_EST=`cat $TMP01 | grep 10\.5\.51\.93 |grep EST |wc -l |awk {'print $1'}`
	NSA02_WFA_EST=`cat $TMP02 | grep 10\.5\.51\.93 |grep EST |wc -l |awk {'print $1'}`

	NSA01_DFM=`cat $TMP01 | grep 10\.5\.64\.21 |wc -l |awk {'print $1'}`
	NSA02_DFM=`cat $TMP02 | grep 10\.5\.64\.21 |wc -l |awk {'print $1'}`

	NSA01_DFM_EST=`cat $TMP01 | grep 10\.5\.64\.21 |grep EST|wc -l |awk {'print $1'}`
	NSA02_DFM_EST=`cat $TMP02 | grep 10\.5\.64\.21 |grep EST |wc -l |awk {'print $1'}`


	echo `date +%Y%m%d_%H%M%S` : llnsa01: Total 443: $NSA01_443 \| Total 80: $NSA01_80 \|  443 EST: $NSA01_443_EST \| 80 EST: $NSA01_80_EST \| WFA TOTAL: $NSA01_WFA \| WFA EST: $NSA01_WFA_EST \| DFM TOTAL: $NSA01_DFM \| DFM EST: $NSA01_DFM_EST
	echo `date +%Y%m%d_%H%M%S` : llnsa02: Total 443: $NSA02_443 \| Total 80: $NSA02_80 \|  443 EST: $NSA02_443_EST \| 80 EST: $NSA02_80_EST \| WFA TOTAL: $NSA02_WFA \| WFA EST: $NSA02_WFA_EST \| DFM TOTAL: $NSA02_DFM \| DFM EST: $NSA02_DFM_EST
done
