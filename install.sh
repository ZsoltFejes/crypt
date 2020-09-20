#!/bin/bash

curl https://raw.githubusercontent.com/ZsoltFejes/crypt/master/dist/crypt --output /sbin/crypt
chmod +x /usr/sbin/crypt

echo
if ! command -v crypt &> /dev/null
then
	echo "crypt could not be found"
	exit
else
	echo "Installation succesful"
fi

crypt -v
