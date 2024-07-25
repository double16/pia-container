#!/usr/bin/env bash
piactl get connectionstate | grep -qi 'Connected'
