# The Crypt Project
'''
usage: crypt [-h] -s [SOURCE] [-v] [-e] [-d] [-r] [-p [PASSWORD]]
             [-o [OUTPUT]]

Crypt uses AES256-CBC to encrypt/decrypt files.

required arguments:
  -s [SOURCE], --source [SOURCE]
                        Path to Source File

optional arguments:
  -e, --encrypt         Encrypt
  -d, --decrypt         Decrypt
  -r, --remove          Remove rouce file after encrypted/decrypted
  -p [PASSWORD], --password [PASSWORD]
                        Encyption/Decryption Password
  -o [OUTPUT], --output [OUTPUT]
                        Output file, otherwise the file will be called
                        [source].aes
'''
