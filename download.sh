#!/usr/bin/env bash

set -x

if [ "$(uname -m)" == "arm64" ] || [ "$(uname -m)" == "aarch64" ]; then
  curl -L -o /tmp/pia.run https://installers.privateinternetaccess.com/download/pia-linux-arm64-$1.run
else
  curl -L -o /tmp/pia.run https://installers.privateinternetaccess.com/download/pia-linux-$1.run
fi
