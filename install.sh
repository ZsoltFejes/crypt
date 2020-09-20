#!/bin/bash

curl https://raw.githubusercontent.com/ZsoltFejes/crypt/master/dist/crypt --output /usr/local/sbin/crypt
chmod +x /usr/local/sbin/crypt

echo
if ! command -v crypt &> /dev/null
then
	echo "crypt could not be found"
	exit
else
	echo "Installation succesful"
fi

crypt -v
