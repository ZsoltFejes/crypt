#!/usr/bin/python3
from os import remove as rm
import argparse
import subprocess
import pyAesCrypt
import getpass
from _version import __version__

__author__ = "Zsolt Fejes"
__copyright__ = "Copyright 2020, The Crypt Project"
__credits__ = ["Zsolt Fejes"]
__license__ = "MIT License"
__version__ = "1.0.0"
__maintainer__ = "Zsolt Fejes"
__email__ = "zsolt.fejes@giliot.com"
__status__ = "Production"

#Parsing Arguments
parser = argparse.ArgumentParser(description='Crypt uses AES256-CBC to encrypt/decrypt files.')
parser._action_groups.pop()

required = parser.add_argument_group('required arguments')
required.add_argument('-s', '--source', metavar='[SOURCE]', type=str, help='Path to Source File', required=True)

optional = parser.add_argument_group('optional arguments')
parser.add_argument('-v', '--version', action='version', version='%(prog)s ' + __version__)
optional.add_argument('-e', '--encrypt', help='Encrypt', action="store_true")
optional.add_argument('-d', '--decrypt', help='Decrypt', action="store_true")
optional.add_argument('-r', '--remove', help='Remove rouce file after encrypted/decrypted', action="store_true")
optional.add_argument('-p', '--password', metavar='[PASSWORD]', type=str, help='Encyption/Decryption Password')
optional.add_argument('-o', '--output', metavar='[OUTPUT]', type=str, help='Output file, otherwise the file will be called [source].aes')
args = parser.parse_args()

#Parsing source from arguments
source = args.source


if args.encrypt == True and args.decrypt == True:
    print("Script can't Encrypt and Decript at the same time.")
    exit()
if args.encrypt == False and args.decrypt == False:
    print("You need to select encrypt or decrypt, use --help for more information")
    exit()

# encryption/decryption buffer size - 64K
bufferSize = 64 * 1024 

#Prompt for password if not provided from command
if args.password == None:
    password = getpass.getpass(prompt='Password: ', stream=None) 
else:
    password = args.password

# encrypt 
if args.encrypt == True:
    if args.output == None:
        output = f"{source}.aes"
    else:
        output = args.output
    pyAesCrypt.encryptFile(source, output, password, bufferSize)
    if args.remove == True:
        rm(source)

# decrypt 
if args.decrypt == True:
    if args.output == None:
        if source.endswith('.aes'):
            output = source[:-4]
    else:
        output = args.output
    try:
        pyAesCrypt.decryptFile(source, output, password, bufferSize)
        if args.remove == True:
            rm(source)
    except ValueError as error:
        print(f"Error during decryption: {error}")

