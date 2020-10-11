#!/bin/sh

set -e

if [ ! -d /znc-data/.git ]; then
    echo "installing znc configuration"
    GIT_SSH_COMMAND='ssh -o stricthostkeychecking=no -i /tmp/deploykeys/znc-config-deploy' \
    git -C /znc-data clone git@github.com:larsks/ircproxy-znc-config.git .
fi

echo "installing znc certificate"
cp /data/znc-certificate/znc.pem /znc-data/znc.pem

if [ "$(id -u)" -eq 0 ]; then
	chown -R 1000 /znc-data
fi
