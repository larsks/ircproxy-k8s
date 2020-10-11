#!/bin/sh

set -e

if [ ! -d /var/lib/bitlbee/.git ]; then
    echo "installing bitlbee configuration"
    GIT_SSH_COMMAND='ssh -o stricthostkeychecking=no -i /tmp/deploykeys/bitlbee-config-deploy' \
    git -C /var/lib/bitlbee clone git@github.com:larsks/ircproxy-bitlbee-config.git .
fi

if [ "$(id -u)" -eq 0 ]; then
	chown -R 1000 /var/lib/bitlbee
fi
