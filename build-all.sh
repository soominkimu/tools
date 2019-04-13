#!/bin/zsh
RED='\e[0;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
YELLOW='\e[0;33m'
NC='\e[0m'
DATE=`date +"Date : %a %m/%d/%Y"`
TIME=`date +"Time : %H.%M.%S"`
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
)

if [ "$#" -gt 0 ]; then
  print "${RED}No Build${NC}"
else
  for p in "${PJT[@]}"; do
    cd ~/D/P/${p}
    if [ $p = "weeklywomen" ]; then
      BUILDER='grunt'
    else
      BUILDER='yarn'
    fi
    print "# ${GREEN}$PWD/${BLUE}${BUILDER} build${NC}"
    ${BUILDER} build
  done
  cd ..
fi

DEST0=~/D/GHP/soominkimu.github.io
if [ -d $DEST0 ]; then

  PJT+=(
    "modeling-cal"
    "sq-architect"
  )

  print "${GREEN}rsync ${BLUE}-r --exclude='.*' --delete ${GREEN}FROM ${YELLOW}TO${NC}"
  COUNTER=0
  for p in "${PJT[@]}"; do
    if [ $p = "spacetimeq-labs" ]; then
      DEST=$DEST0
    else
      DEST=$DEST0/P/$p
    fi
    let COUNTER=COUNTER+1
    printf "%2d) " $COUNTER
    print "${GREEN}~/D/P/${RED}${p}${GREEN}/build/${NC} -> ${YELLOW}${DEST}/${NC}"
    rsync -r --exclude='.*' --delete ~/D/P/$p/build/ $DEST/
  done
  cp ~/D/P/be-fileserver/data/weather-*.json $DEST0/data/
  cp ~/D/P/be-csv2json/dataJSON/M_tokyo-Avg.json $DEST0/data/
else
  print "${RED}Directory ${DEST0} does not exist!${NC}"
fi
