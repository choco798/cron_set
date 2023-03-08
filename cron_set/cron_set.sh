#!/bin/sh
num=1
backnum=$(crontab -l | grep -v '#' | wc -l)
bucheck=$(ls backup*.txt | wc -l)
pycheck=$(ls *.py)

if [ $backnum -ne 0 ];
then
	echo "バックアップを作ります"
	crontab -l > backup$bucheck.txt
else
	echo no
fi

if [ $(ls *.py | wc -l) -ge 2 ];
then
	echo "" > settei.txt
	for again in $pycheck
	do
		echo "@reboot python3 $(pwd)/$again" >> settei.txt
	done
else
		echo "@reboot python3 $(pwd)/$pycheck" > settei.txt
		
fi

crontab settei.txt
