#!/bin/bash

cd /pocketmine/PocketMine-MP

if ! [ -e server.properties ]; then
    echo >&2 "[WARN] server.properties is not found in $(pwd). Copying from the original assets."
    cp -p ../server.properties.original server.properties
    chown pocketmine:pocketmine server.properties
fi

if ! [ -e PocketMine-MP.phar ]; then
    echo >&2 "[WARN] PocketMine-MP.phar is not found in $(pwd). Installing the latest stable release."
    wget -q -O - http://cdn.pocketmine.net/installer.sh | bash -s - -r
    chown -R pocketmine:pocketmine /pocketmine
fi

if [ "$UPDATE_LATEST" = 'YES' ]; then
    echo "[INFO] Updating to the latest stable release."
    wget -q -O - http://cdn.pocketmine.net/installer.sh | bash -s - -r -v Alpha_1.3.12
    chown -R pocketmine:pocketmine /pocketmine
fi

if [ "$UPDATE_LATEST_BETA" = 'YES' ]; then
    echo "[INFO] Updating to the latest beta release."
    wget -q -O - http://cdn.pocketmine.net/installer.sh | bash -s - -r -v beta
    chown -R pocketmine:pocketmine /pocketmine
fi

su - pocketmine "/pocketmine/PocketMine-MP/start.sh"
