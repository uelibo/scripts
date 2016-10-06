#!/bin/bash

# https://www.freedesktop.org/software/systemd/man/systemd-detect-virt.html
if [ -x "/usr/bin/systemd-detect-virt" ] ; then
  detect="$(/usr/bin/systemd-detect-virt)"
  if [ "$detect" == "xen" ] ; then echo Xen ; exit 0 ; fi
  if [ "$detect" == "kvm" ] ; then echo KVM ; exit 0 ; fi
  if [ "$detect" == "vmware" ] ; then echo VMware ; exit 0 ; fi
  if [ "$detect" == "oracle" ] ; then echo VirtualBox ; exit 0 ; fi
  echo ------------
  echo systemd-detect-virt:
  echo $detect
fi


if [ "$UID" == 0 ] ; then

  if [ -x "/usr/sbin/dmidecode" ] ; then
    manuf="$(/usr/sbin/dmidecode -s system-manufacturer)"
    prod="$(/usr/sbin/dmidecode -s system-product-name)"
    if [ "$manuf" == "Xen" ] ; then echo Xen ; exit 0 ; fi
    if [ "$prod"  == "KVM" ] ; then echo KVM ; exit 0 ; fi
    if [ "$manuf" == "VMware, Inc." ] ; then echo VMware ; exit 0 ; fi
    if [ "$prod"  == "VirtualBox" ] ; then echo VirtualBox ; exit 0 ; fi
    echo ------------
    echo dmidecode:
    echo $manuf $prod
  fi
  
  if [ -x "/usr/bin/lshw" ] ; then
    echo ------------
    echo lshw:
    LANG=c /usr/bin/lshw -class system | egrep "(product|vendor)"
  fi
  
  if [ -x "/opt/puppetlabs/bin/facter" ] ; then
    echo ------------
    echo puppet facter:
     /opt/puppetlabs/bin/facter virtual
  fi
  
  if [ -x "/usr/sbin/virt-what" ] ; then
    echo ------------
    echo virt-what:
    /usr/sbin/virt-what
  fi

else
  echo "Please run as user root!"
fi

