#!/bin/bash

echo "------Welcome To Smanager------"

echo "Options--"
echo "1. Delete Photos that are 90 days old"
echo "2. Delete videos that are 90 days old"

x=$(pwd)
read ch
cd ~/Documents
case $ch in 
	1)
		find -mtime +90 -name "*\.png" | rename 's/ /_/g'
		a=$(find -mtime +90 -name "*\.png")
		b=$(find -mtime +90 -name "*\.png" | wc -l)
		if [[ $b -eq 0 ]]; then
			echo "no pics are older than 90 days"
		else
			rm ${a}
			echo "$b pics deleted"
		fi
		;;
	2)
		find -mtime +90 -name "*\.mp4" | rename 's/ /_/g'
		a=$(find -mtime +90 -name "*\.mp4")
		b=$(find -mtime +90 -name "*\.mp4" | wc -l)
		if [[ $b -eq 0 ]]; then
			echo "no videos are older than 90 days"
		else
			rm ${a}
			echo "$b videos deleted"
		fi
		;;
	*)
		echo "Invalid choice "
esac	

cd ${x}
