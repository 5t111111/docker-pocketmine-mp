#!/bin/bash

cd /usr/local/pocketmine-mp

if ! [ -e server.properties ]; then
    echo >&2 "[WARN] server.properties is not found in $(pwd). Copying from the original assets."
    cp -p /server.properties.original server.properties
fi

if ! [ -e PocketMine-MP.phar ]; then
    echo >&2 "[WARN] PocketMine-MP.phar is not found in $(pwd). Installing the latest beta release."
    wget -q -O - http://cdn.pocketmine.net/installer.sh | bash -s - -v beta
fi

if [ "$UPDATE_LATEST" = 'YES' ]; then
    echo "[INFO] Updating to the latest beta release."
    wget -q -O - http://cdn.pocketmine.net/installer.sh | bash -s - -v beta
fi

./start.sh
