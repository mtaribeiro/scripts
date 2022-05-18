#!/bin/bash
if [[ "$1" =~ ^-{0,2}h(elp)?$ ]]
then
  echo "This script runs a specific test for all retailers available in config folder"
  echo "runtest.sh arg1 [arg2]"
  echo "arg1 = script name ex.'./path/scriptname'" 
  echo "arg2 = optional. If arg2=bs then run the script using browserstack config file if not run local"
  exit 0
fi
# retailers="arnotts bash benbridge bloom brownt buckle chicos cosbar cotr danmurphys dxl elguntors gnc hbc holt humantouch jwas lilly macys novartis perrysport peru pharmaprix rtb saks shiseido shoppers sjk soma whbm"

if ! [[ $(pwd) =~ wdioTest$ ]]
then
  echo "This command runs only from wdioTest folder"
  exit 2
fi

retailerList=''
#for retailer in $retailers
for retailer in $(ls -d ./config/*/)
do
  # echo "Running "$retailer
  retailerName="${retailer//\.\/config\//}"
  retailerName="${retailerName//\// }"
  retailerList+=$retailerName

  if [[ "$1" =~ ^-{0,2}l(ine)? ]]
  then 
    echo $retailerName
  fi

done
# works like a return
if ! [[ "$1" =~ ^-{0,2}l(ine)? ]]
then
  echo $retailerList
fi
