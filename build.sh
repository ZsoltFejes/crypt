#!/bin/bash

pyinstaller --onefile crypt.py

echo "Recreating README.md File"

cat > README.md <<EOF
# The Crypt Project
### Help
```
HELP=$(dist/crypt --h)
```
## Installation
### Linux

Run the following command in cli:

`bash <(curl -s https://raw.githubusercontent.com/ZsoltFejes/crypt/master/install.sh)`
EOF
echo "New README File has been created"






