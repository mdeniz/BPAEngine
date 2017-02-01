#!/bin/bash

## Preview Plymouth Splash ##
##      by _khAttAm_       ##
##    www.khattam.info     ##
##    License: GPL v3      ##

chk_root () {
  if [ ! $( id -u ) -eq 0 ]; then
    echo Must be run as root
    exit
  fi
}

chk_root

DURATION=15
if [ $# -gt 0 ]; then
  DURATION=$1
fi

PATH="source/sandbox"
if [ $# -gt 1 ]; then
  PATH="$2"
fi


./export.sh "$PATH" "preview_theme" # Exporting to the provisioned default theme

# Preview it
echo "Previewing theme during $DURATION seconds..."
plymouthd # --debug --debug-file=/tmp/plymouth-debug-out.log ;
plymouth --show-splash
for ((I=0; I<$DURATION; I++)); do
  plymouth --update=test$I;
  sleep 1;
  done;
plymouth quit
echo "Preview Done!"
