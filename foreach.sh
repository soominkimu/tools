#!/bin/zsh
# ForEach, run command (from arguments) for each project
# foreach   # list all projects
# foreach git status
# foreach git --no-pager lol
# foreach git add -A
CBLACK='\e[30m'
RED='\e[0;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
YELLOW='\e[0;33m'
CREDBG='\e[41m'
CGREENBG='\e[42m'
CYELLOWBG='\e[43m'
CWHITEBG='\e[47m'
NC='\e[0m'
DATE=`date +"Date : %a %m/%d/%Y"`
TIME=`date +"Time : %H.%M.%S"`
print "Provided command in the arguments: ${CBLACK}${CYELLOWBG}$@${NC}"
print "${YELLOW}${DATE} ${GREEN}${TIME}${NC}"
PJT=(
  "spacetimeq-labs"
  "artmoon"
  "cal-heatmap"
  "eglobe"
  "heatmap-tokyo"
  "jp-map-vid"
  "planet-earth"
  "sq3d-demo"
  "sq3d-polygon"
  "stq-prototype"
  "weeklywomen"
  "modeling-cal"
  "sq-architect"
  "be-csv2json"
  "be-starmap"
  "be-scrape"
  "be-fileserver"
  "be-tools"
)

COUNTER=0
for p in "${PJT[@]}"; do
  cd ~/D/P/${p}
  let COUNTER=COUNTER+1
  printf "######### %02d)" $COUNTER
  if [ -d .git ]; then
    if [[ $p == be-* ]]; then
      printf " ${CBLACK}${CWHITEBG}%-16s${NC}" $p
      print " ${NC}$PWD/${BLUE}$@${NC}"
    else
      printf " ${CBLACK}${CGREENBG}%-16s${NC}" $p
      print " ${GREEN}$PWD/${BLUE}$@${NC}"
    fi
    $@
  else
    printf " ${CBLACK}${CYELLOWBG}%-16s${NC}" $p
    print " ${BLUE}$PWD/${NC}"
    if [ "$#" -gt 0 ]; then
      ls -la build/*
    fi
  fi
done

cd ..
