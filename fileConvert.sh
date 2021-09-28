#!/bin/bash

output=`ls *.txt`

cd data/
mkdir editedFiles

for i in $(ls *.txt *.csv)
do
	file $i
	cat $i | tr -d '\r' | iconv -c -f UTF-8 -t LATIN1 > $i-edited
	file $i-edited 
	mv $i-edited editedFiles
	D=`echo $i-edited | awk -F- '{print $1}'`
	cd editedFiles
	mv $i-edited $D
	cd ../
done
