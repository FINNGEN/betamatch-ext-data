#!/bin/bash

cd data/
output=`ls *.txt *.csv`

for i in $output
do
	isCRLF=$(file $i)
	echo $isCRLF

	if [[ $isCRLF =~ ", with CRLF line terminators" ]]
	then
		echo "processing $i"
		file $i
		cat $i | tr -d '\r' | iconv -c -f UTF-8 -t LATIN1 > $i-edited
		file $i-edited 
		D=`echo $i-edited | awk -F- '{print $1}'`
		mv $i-edited $D
	else 
		echo "not it"
	fi
done