#!/bin/sh

returnfile=$(ls *.txt)

crontab $returnfile
crontab -l > settei.txt
