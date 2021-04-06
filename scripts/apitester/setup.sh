#!/usr/bin/env bash
# Colors
C='\033[0;36m'
R='\033[0;31m'
G='\033[0;32m'
NC='\033[0m'
COOL_FOLDER="$HOME/.$USER.scripts/apitester"
mkdir -p "$COOL_FOLDER"
cp -r . $COOL_FOLDER
echo -e "${G}Copied apitester files to $COOL_FOLDER ${NC}"
if grep -q "apitester" ~/.bashrc
then
  echo -e "Already found alias ${C}apitester${NC}"
else
  echo 'alias apitester="python '"$COOL_FOLDER"'/api.py"' >> ~/.bashrc
  echo -e "${G}Added alias apitester to bashrc${NC}"
fi

if grep -q "apitesteredit" ~/.bashrc
then
  echo -e "Already found alias ${C}apitesteredit${NC}"
else
  echo 'alias apitesteredit="'"$EDITOR"' '"$COOL_FOLDER"'/profile_data.py"' >> ~/.bashrc
  echo -e "${G}Added alias apitesteredit to bashrc${NC}"
fi
