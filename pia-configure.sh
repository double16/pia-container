#!/usr/bin/env bash

#
# Configure PIA
#

/usr/local/bin/piactl -d background enable || exit $?

/usr/local/bin/piactl -d login /config/pia-auth.conf
LOGIN_CODE=$?
# 127 is returned if already logged in
if [[ ${LOGIN_CODE} -eq 127 ]] || [[ ${LOGIN_CODE} -eq 0 ]]; then
  exit 0
fi

exit ${LOGIN_CODE}
