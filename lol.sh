#!/bin/sh

#Preferences
file=./macs.txt;

echo "Congradulations on your finding this script...";
echo "Here are a list of the valid MAC addresses:\n";

IFS=$'\n' read -d '' -r -a lines < $file;

for (( i = 0; i < ${#lines[@]}; i++ )); do
	echo "$i  -  ${lines[i]}";
done

echo "\nInput the index of the mac adress you want to set";
read macINDEX;

echo "Now we need to get the interface ID for the network device we want to spoof...";
echo "Here's a list of all your interfaces... you'll be looking for something like this: en0";
echo "Press enter when you are ready to see a list of the interfaces";

read;

ifconfig;

echo "Enter the interface ID";

read interfaceID;

sudo ifconfig $interfaceID ether ${lines[macINDEX]};

echo "\nSet $interfaceID MAC to ${lines[macINDEX]}";