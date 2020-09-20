#!/bin/bash

pyinstaller --onefile crypt.py

echo "Recreating README.md File"
HELP=$(dist/crypt --h)
cat > README.md <<EOF
# The Crypt Project
$HELP
EOF
echo "New README File has been created"
