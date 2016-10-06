#!/bin/bash

echo "Hostname:       $(hostname -f)"
echo "Kernel:         $(uname -r)"
echo "Virtualization: $(virtualized.sh)"

if [ -f "/etc/debian_version" ] ; then
  echo "Debian-Version: $(cat /etc/debian_version)"
fi

if [ -f "/etc/lsb-release" ] ; then
  source /etc/lsb-release
  echo "Distribution:   $DISTRIB_ID $DISTRIB_RELEASE ($DISTRIB_CODENAME)"
fi

if [ -f "/etc/os-release" ] ; then
  source /etc/os-release
  echo "Distribution:   $NAME $VERSION"
fi


