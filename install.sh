#!/bin/bash

curl https://raw.githubusercontent.com/ZsoltFejes/crypt/master/dist/crypt --output /usr/local/bin/crypt
chmod +x /usr/local/bin/crypt

echo
if ! command -v crypt &> /dev/null
then
	echo "crypt could not be found"
	exit
else
	echo "Installation succesful"
fi

crypt -v
