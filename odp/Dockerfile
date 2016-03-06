FROM zlim/ubuntu-dev
MAINTAINER Zi Shen Lim <zlim.lnx@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        automake autoconf libtool \
        libssl-dev \
        mscgen doxygen graphviz \
        asciidoc source-highlight librsvg2-bin \
        libcunit1-dev

ENV GIT_REPO	http://git.linaro.org/git-ro/lng/odp.git
ENV GIT_BRANCH	master

WORKDIR /work

RUN git clone -b ${GIT_BRANCH} -- ${GIT_REPO} odp

WORKDIR odp

RUN ./bootstrap
RUN ./configure --enable-user-guide --enable-cunit --enable-test-perf --enable-test-vald
RUN make
RUN make doxygen-doc
RUN make install
RUN make check

