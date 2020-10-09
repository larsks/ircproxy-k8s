#!/bin/sh

if [ ! -d /znc/.git ]; then
    echo "installing znc configuration"
    GIT_SSH_COMMAND='ssh -o stricthostkeychecking=no -i /tmp/deploykeys/znc-config-deploy' \
    git -C /znc clone git@github.com:larsks/ircproxy-znc-config.git .
fi

echo "installing znc certificate"
cp /znc-certificate/znc.pem /znc/znc.pem
