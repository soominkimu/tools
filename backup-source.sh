#!/bin/zsh
RED='\e[0;32m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
YELLOW='\e[0;33m'
NC='\e[0m'
DATE=`date +"Date : %a %m/%d/%Y"`
TIME=`date +"Time : %H.%M.%S"`
print "${YELLOW}${DATE} ${GREEN}${TIME}${NC}"

print "${BLUE}rsync -ruth --progress --exclude=node_modules --exclude=build ${NC}~/D/P/ ${YELLOW}~/D/Backup/P/${NC}"
rsync -ruth --progress --exclude='node_modules' --exclude='build' ~/D/P/ ~/D/Backup/P/
