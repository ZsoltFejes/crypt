#!/bin/bash

PATH=/usr/local/bin/crypt

################################################################################
# Help                                                                         #
################################################################################
function Help () {
        # Display Help
        echo "Rareloop Laravel environment deployment script."
        echo
        echo "Syntax: ./RareloopLaravelDeploy.sh [OPTION]"
        echo "options:"
        echo "-s|--skip       The specified step will not be carried out"
        echo "--stage         Only the specified stage will be run"
        echo "-r|--restart    In Case you want to restart the full deployment"
        echo "-d|--deploy     If you only want to deploy a new site on"
        echo "                an already provisioned server."
        echo "--remove-domain Removes domain from the server including the domain user"
        echo
}


# Loop through arguments and process them
for arg in "$@"
do
    case $arg in
        -h|--help)
        Help
        exit
        ;;
        -l|--local)
        PATH=~/bin/crypt
        shift # Remove -s|--skip from processing
        ;;
        *)
        OTHER_ARGUMENTS+=("$1")
        shift # Remove generic argument from processing
        ;;
    esac
done

curl https://raw.githubusercontent.com/ZsoltFejes/crypt/master/dist/crypt --output $PATH
chmod +x PATH

echo
if ! command -v crypt &> /dev/null
then
	echo "crypt could not be found"
	exit
else
	echo "Installation succesful"
fi

crypt -v
