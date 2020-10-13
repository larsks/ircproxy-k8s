#!/bin/sh

set -e

DATADIR=/znc-data

if [ ! -d $DATADIR/configs/znc.conf ]; then
    echo "installing znc configuration"
    GIT_SSH_COMMAND='ssh -o stricthostkeychecking=no -i /tmp/deploykeys/znc-config-deploy' \
    git clone git@github.com:larsks/ircproxy-znc-config.git /tmp/init-data
    tar -C /tmp/init-data -cf- . | tar -C $DATADIR -xf-
fi

echo "installing znc certificate"
cp /data/znc-certificate/znc.pem $DATADIR/znc.pem

if [ "$(id -u)" -eq 0 ]; then
	chown -R 1000 $DATADIR
fi
