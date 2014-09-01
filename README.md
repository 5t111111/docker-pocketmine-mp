docker-pocketmine-mp
====================

Docker image for a PocketMine-MP server.
It includes the latest BETA version and NOT stable one because the latest stable version is not working for the latest Minecraft PE.

Quick Start
--------------------

```
docker run --name=pocketmine-mp -d -p 19132:19132/udp 5t111111/pocketmine-mp:latest
```

Data Persistence
--------------------

You might want to keep your data from losing.
The easiest way is to create a direcory on host filesystem and mount it to `/usr/local/pocketmine-mp` in a container.

```
mkdir /opt/pocketmine-mp
```

```
docker run --name=pocketmine-mp -d -v /opt/pocketmine-mp:/usr/local/pocketmine-mp \
    -p 19132:19132/udp 5t111111/pocketmine-mp:latest
```

You can also edit `server.properties`. 

Update
--------------------

Set the environment variable `UPDATE_LATEST = YES` to force update the latest BETA release.

```
docker run --name=pocketmine-mp -d -v /opt/pocketmine-mp:/usr/local/pocketmine-mp \
    -p 19132:19132/udp -e "UPDATE_LATEST=YES" 5t111111/pocketmine-mp:latest
```
