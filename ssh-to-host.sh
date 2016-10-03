#!/bin/bash

host=$(basename $0)

function help {
  echo -e "\nUsage: $0 [-u|-h] \n\t -u : Connect as User ($USER) insted as root\n"
}

case "$1" in
  -u) logonuser=$USER;;
  -h|--help) help; exit;;
  *) logonuser=root;;
esac 

if [ $(ssh-add -L | wc -l) == 0 ]
  then ssh-add
fi

echo "ssh -AC $logonuser@$host"
ssh -AC $logonuser@$host
