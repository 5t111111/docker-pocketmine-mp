FROM ubuntu:14.04

MAINTAINER 5t111111 https://github.com/5t111111

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y \
        wget \
        perl gcc g++ make automake libtool autoconf m4 \
        gcc-multilib

RUN adduser --gecos 'PocketMine-MP' --disabled-password --home /pocketmine pocketmine

WORKDIR /pocketmine
RUN mkdir /pocketmine/PocketMine-MP

RUN cd PocketMine-MP && wget -q -O - http://cdn.pocketmine.net/installer.sh | bash -s - -r -v beta

COPY assets/server.properties /pocketmine/server.properties.original
COPY assets/entrypoint.sh /pocketmine/entrypoint.sh

RUN chown -R pocketmine:pocketmine /pocketmine
RUN chmod 755 /pocketmine/entrypoint.sh

EXPOSE 19132/udp

ENTRYPOINT ["./entrypoint.sh"]
