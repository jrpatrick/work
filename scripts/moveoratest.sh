 for i in `cat ./oratollnsa01`
do
ssh llnsa01 ndmpcopy llnsa02:/vol/${i}_arch/arch  llnsa01:/vol/${i}_arch/arch
ssh llnsa01 ndmpcopy llnsa02:/vol/${i}_ctl llnsa01:/vol/${i}_ctl
ssh llnsa01 ndmpcopy llnsa02:/vol/${i}_data llnsa01:/vol/${i}_data
ssh llnsa01 ndmpcopy llnsa02:/vol/${i}_rft llnsa01:/vol/${i}_rft

done

