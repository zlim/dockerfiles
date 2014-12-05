FROM ubuntu:14.10
MAINTAINER Zi Shen Lim <zlim.lnx@gmail.com>

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        bc \
        gcc \
        git \
        make

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        gcc-aarch64-linux-gnu

