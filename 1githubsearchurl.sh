#!/bin/bash

if [[ -z $1 ]];
then
	echo "please provide the domain name"
	exit
fi
rm -f git_hub_links.txt
for i in $(cat dorklist.txt)
do
	echo $i >> git_hub_links.txt
	echo "https://github.com/search?q=%22$1%22+$i&type=Code" >> git_hub_links.txt
	echo ""
	echo ""
done

