FROM ubuntu

RUN  apt-get update &&\
     apt-get install wget git-core build-essential libssl-dev libncurses5-dev unzip gawk subversion mercurial -y

RUN useradd builder && su builder

RUN git clone https://github.com/openwrt/openwrt.git

ADD .config openwrt/

RUN cd openwrt &&\
    git checkout v15.05.1 &&\
    ./scripts/feeds update -a &&\
    ./scripts/feeds install -a &&\
    make V=99 -j4
