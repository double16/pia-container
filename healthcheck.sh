#!/usr/bin/env bash
export LD_LIBRARY_PATH=/opt/piavpn/lib
piactl get connectionstate | grep -qi 'Connected'
