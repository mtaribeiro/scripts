#!/bin/bash
if [ "$1" == "help" ]
then
  echo "This script runs a specific test for all retailers available in config folder"
  echo "Run= runtest.sh arg1 arg2"
  echo "arg1 = script name ex.'./path/scriptname'" 
  echo "arg2 = optional. If arg2=bs then run the script using browserstack config file if not run local"
  exit 0
fi
# retailers="arnotts bash benbridge bloom brownt buckle chicos cosbar cotr danmurphys dxl elguntors gnc hbc holt humantouch jwas lilly macys novartis perrysport peru pharmaprix rtb saks shiseido shoppers sjk soma whbm"
retailers="$(
  cd ./config;
  retailerList=''
  #for retailer in $retailers
  for retailer in $(ls -d */)
  do
   # echo "Running "$retailer
    retailerList+=${retailer//\// }
  done
  # works like a return
  echo $retailerList
)"
#echo "valor ret="$retailers
for retailer in $retailers
do
  echo "Running "$retailer
  export NODE_ENV=${retailer}
  export NODE_APP_INSTANCE=qa05;
  #npx wdio wdio.conf.js --spec=./test/footer/footer.spec.js
  #node_modules/@wdio/cli/bin/wdio.js wdio.conf.js --spec=./test/footer/footer.spec.js
  if [ "$2" == "bs" ]
  then
    npx wdio wdio.conf.browserstack.js --spec ${1}
  else
    npx wdio wdio.conf.js --spec ${1}
  fi
done