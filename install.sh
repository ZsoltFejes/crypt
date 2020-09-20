
#!/bin/bash

PATH_TO=/usr/local/bin/crypt
USER=$(whoami)
################################################################################
# Help                                                                         #
################################################################################
function Help () {
        # Display Help
        echo "The Crypt Project Installation Script"
        echo
        echo "Syntax: bash <(curl -s https://raw.githubusercontent.com/ZsoltFejes/crypt/master/install.sh) [-l|--local]"
        echo "options:"
        echo "-l|--local      The script will only be installed for only the user that run it"
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
        PATH_TO=$(eval echo ~"$USER")/.local/bin/crypt
        shift # Remove -s|--skip from processing
        ;;
        *)
        OTHER_ARGUMENTS+=("$1")
        shift # Remove generic argument from processing
        ;;
    esac
done

curl https://raw.githubusercontent.com/ZsoltFejes/crypt/master/dist/crypt --output $PATH_TO
chmod +x $PATH_TO

echo
if ! command -v crypt &> /dev/null
then
	echo "crypt could not be found"
	exit
else
	echo "Installation succesful"
fi

crypt -v
