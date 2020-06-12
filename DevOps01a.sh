#!/bin/bash
echo "***** volume *****"
diskutil list
echo "***** cpu *****"
system_profiler SPHardwareDataType
echo "***** ram  *****"
sysctl hw.memsize
echo "***** MAC Address *****"
ifconfig | grep ether |sed -n '1p' |& tee -a n2-results.txt

echo "***** IP address ***** " |& tee -a n2-results.txt 
curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g' |& tee -a n2-results.txt

