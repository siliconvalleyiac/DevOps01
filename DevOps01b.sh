#!/bin/bash


echo "************** here are your commands: ************
-volumes
-cpu
-ram
-network
-all
"

read -p "Enter your command: " var1

case $var1 in

	volumes)
echo "***** volume *****"
            diskutil list;;

	cpu)
echo "***** cpu *****"
            system_profiler SPHardwareDataType;;

	ram)
echo "***** ram  *****"
            sysctl hw.memsize;;

	network)
echo "***** MAC Address *****"
ifconfig | grep ether |sed -n '1p' 

echo "***** IP address ***** "  
curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g' ;;

	all)
	echo "ALL "

	echo "***** volume *****"
	diskutil list
	echo "***** cpu *****"
	system_profiler SPHardwareDataType
	echo "***** ram  *****"
	sysctl hw.memsize
	echo "***** MAC Address *****"
#	ifconfig | grep ether |sed -n '1p' |& tee -a n2-results.txt
	ifconfig | grep ether |sed -n '1p' 
	#echo "***** IP address ***** " |& tee -a n2-results.txt 
	echo "***** IP address ***** "  
	#curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g' |& tee -a n2-results.txt
	curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g' 
	;;

	*) echo "wrong input, re-start again with following commands:
-volumes
-cpu
-ram
-network
-all";;

esac

