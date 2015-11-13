D=0
cd /mnt/efare1/Users/efare

echo `date` >> /tmp/rmdeepdir.out
rm -rf 20100219 >/tmp/rmdeepdir.log 2>/tmp/deepdir.err
echo `date` >> /tmp/rmdeepdir.out

