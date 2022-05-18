#!/bin/bash

# if [[ "$1" == "help" || "$1" == "--help" || "$1" == "-h" ]]
if [[ "$1" =~ ^-{0,2}h(elp)?$ ]]
then
  echo "Show all retailers for Mobile platform. All retailers are displayed in one line"
  echo "mretailerList.sh [-l -h]"
  echo "Options:"
  echo "-l, line           show a one retailer par line if not " 
  echo "-h, --help, help   shows the help"
  exit 0
fi

if ! [[ $(pwd) =~ mobileTest$ ]]
then
  echo "This command runs only from mobileTest folder"
  exit 2
fi

for retailer in $(ls ./config/*.js)
do
  if [ "$retailer" != "./config/default.js" ]
  then
    retailerName="${retailer//\.\/config\//}"
    retailerName="${retailerName//\.js/ }"
    retailerList+=$retailerName
    if [[ "$1" =~ ^-{0,2}l(ine)? ]]
    then 
      echo $retailerName
    fi
  fi
done

if ! [[ "$1" =~ ^-{0,2}l(ine)? ]]
then
  echo $retailerList
fi