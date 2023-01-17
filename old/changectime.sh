#!/bin/zsh
# http://stackoverflow.com/questions/16126992/setting-changing-the-ctime-or-change-time-attribute-on-a-file/17066309#17066309

d=${0:a:h}
t=200001010000
touch -t $t $d
touch -t $t $d/*
touch -t $t $d/*/*

export now=$(date +"%Y-%m-%d %H:%M:%S")
echo $now
sudo date --set="2000-01-01 00:00:00.00"
chmod -R 777 $d
sudo date --set="$now"

exiftool $d/test.png
