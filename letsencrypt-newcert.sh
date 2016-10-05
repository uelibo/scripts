#!/bin/bash

CERTBOT="/usr/local/sbin/certbot-auto"

if [ -x "$CERTBOT" ] ; then
  https://dl.eff.org/certbot-auto -O $CERTBOT
  chmod 755 $CERTBOT
  $CERTBOT --os-packages-only
fi

$CERTBOT certonly --no-self-upgrade --webroot --webroot-path "/var/www/$HOSTNAME" -d $HOSTNAME

