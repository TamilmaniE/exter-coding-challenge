#!/bin/bash

i=1;
line_f="$(cat t8.shakespeare.txt | wc -l)";

while [[ ${i} -le $line_f ]];
do 
	mue=$(cat t8.shakespeare.txt | head -n ${i} | tail -n 1); 
	firstString=${mue};
	
	for word_from_f in $(cat find_words.txt)
	do
		secondString=$(cat french_dictionary.csv | grep ^${word_from_f}, | cut -d "," -f 2-) ;
		wordt=${word_from_f};
		wordth=$(echo $wordt | tr '[:lower:]' '[:upper:]');
		wordthh=$(echo "${wordt^}");
		firstString=$(echo "${firstString/${wordt}/$secondString}");
		firstString=$(echo "${firstString/${wordth}/$secondString}");
		last=$(echo "${firstString/${wordthh}/$secondString}");
	done
	echo $last
	i=$(($i+1));
done