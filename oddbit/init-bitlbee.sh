#!/bin/sh

set -e

DATADIR=/bitlbee-data

if [ ! -d $DATADIR/larsks.xml ]; then
    echo "installing bitlbee configuration"
    GIT_SSH_COMMAND='ssh -o stricthostkeychecking=no -i /tmp/deploykeys/bitlbee-config-deploy' \
    git clone git@github.com:larsks/ircproxy-bitlbee-config.git /tmp/init-data
    tar -C /tmp/init-data -cf- . | tar -C $DATADIR -xf-
fi

if [ "$(id -u)" -eq 0 ]; then
	chown -R 1000 $DATADIR
fi
