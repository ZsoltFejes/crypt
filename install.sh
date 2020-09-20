#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

curl https://raw.githubusercontent.com/ZsoltFejes/crypt/master/dist/crypt --output /sbin/crypt
chmod +x /sbin/crypt

echo
if ! command -v crypt &> /dev/null
then
	echo "crypt could not be found"
	exit
else
	echo "Installation succesful"
fi

crypt -v
