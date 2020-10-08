#!/bin/sh

if [ ! -d /bitlbee/.git ]; then
    echo "installing bitlbee configuration"
    GIT_SSH_COMMAND='ssh -o stricthostkeychecking=no -i /tmp/deploykeys/bitlbee-config-deploy' \
    git -C /bitlbee clone git@github.com:larsks/ircproxy-bitlbee-config.git .
fi
