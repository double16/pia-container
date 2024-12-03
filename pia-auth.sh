#!/usr/bin/env bash

#
# Configure authorization file
#

[ -s /config/pia-auth.conf ] && exit 0

if [ -n "${PIA_USER}" ] && [ -n "${PIA_PASS}" ]; then
  echo "${PIA_USER}" > /config/pia-auth.conf
  echo "${PIA_PASS}" >> /config/pia-auth.conf
  exit 0
fi

exit 1
