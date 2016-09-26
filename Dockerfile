FROM ubuntu

RUN  apt-get update &&\
     apt-get install git-core build-essential libssl-dev libncurses5-dev unzip gawk &&\
     apt-get install subversion mercurial

RUN git clone https://github.com/openwrt/openwrt.git

RUN cd openwrt \
    ./scripts/feeds update -a\
    ./scripts/feeds install -a

RUN make defconfig

