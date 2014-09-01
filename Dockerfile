FROM ubuntu:14.04

MAINTAINER 5t111111 https://github.com/5t111111

RUN apt-get update && apt-get install -y \
        wget \
        perl gcc g++ make automake libtool autoconf m4 \
        gcc-multilib
	
WORKDIR /usr/local/pocketmine-mp

RUN wget -q -O - http://cdn.pocketmine.net/installer.sh | bash -s - -v beta

COPY assets/server.properties /server.properties.original
COPY assets/entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

EXPOSE 19132/udp

ENTRYPOINT ["/entrypoint.sh"]
