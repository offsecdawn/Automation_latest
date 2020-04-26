#!/bin/bash
if [ -z $1 ];
then
	echo "Usage:./portscan.sh subdomain_file_name"
	exit
fi
echo -e "\n*************************Port enumeration extract has been initiated*****************************************"
echo ""
rm -f portscan.txt
#nmap -n -Pn -sV -v -T4 -p- -iL $subdomain_file -oN namp.scan.txt
subdomain_file=$1
for i in $(cat $subdomain_file)
do
	ip=`dig +short $i | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -1`
	echo $ip
       sudo masscan -p1-65535 $ip --max-rate=1000  >> portscan.txt
done

echo "***********************************Port scan is complete**********************************"
