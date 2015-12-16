FROM ubuntu:14.04
MAINTAINER Marcel Graf <marcel.graf@heig-vd.ch>

RUN dpkg --add-architecture i386 \
&& apt-get update \
&& apt-get -y install libc6:i386 libstdc++6:i386 curl \
&& apt-get clean \
&& curl -O http://cdn.primatelabs.com/Geekbench-3.3.2-Linux.tar.gz \
&& tar -xvzf Geekbench-3.3.2-Linux.tar.gz

CMD [ "dist/Geekbench-3.3.2-Linux/geekbench" ]
