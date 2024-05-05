#!/bin/bash

#This script was created by Michelle Tate
#for JJC Class SP24-CIS272-600

#General script start message.
echo "This script will submit system details to output file sysinfo.txt"
echo

#Check if output file exists and creates if not.
#If file exists, prompts user to clear past file entries.
#Yes response is case-sensitive (Y). No response is case-insensitive.
file=~/sysinfo.txt
if [ ! -e $file ]
then
	touch ~/sysinfo.txt
else
while true; do
read -p "Clear past file entries? (Y/n)" Yn
case $Yn in
	[Y] ) echo > ~/sysinfo.txt; echo "Output file cleared. 
Proceeding..."; break;;
	[Nn] ) echo "Proceeding without clearing file..."; break;;
	* ) echo "Invalid response";;
esac
done
fi

echo "Populating system details..."
#collect system details and outputs to file
{
echo "--#########################--"
echo "##-*-SYSTEM DETAILS-*-##"
date
echo
echo "---System Hostname---"; hostname
echo
echo "---Operating System---"; cat /etc/os-release
echo
echo "---Linux Kernel Version---"; uname -vr
echo
echo "---System Uptime---"; uptime
echo
echo "---IP Information---"; ip addr
echo
echo "---CPU Information---"; lscpu | head -n 13
echo
echo "---Free Memory---"; free -ht
echo
echo "---Filesystem Utilization---"; df -h
echo
echo "---Recent Syslog Errors---"
echo cat /var/log/syslog | grep -i "error" | tail -n 5
echo
} >> ~/sysinfo.txt

echo "COMPLETE"
echo -e "See ~/sysinfo.txt for output."
echo " Use of 'more' is recommended for viewing in some environments."
