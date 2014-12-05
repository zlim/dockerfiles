FROM zlim/ubuntu-dev
MAINTAINER Zi Shen Lim <zlim.lnx@gmail.com>

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        doxygen \
        graphviz \
        libssl-dev \
        libtool

ENV GIT_REPO	http://git.linaro.org/git-ro/lng/odp.git
ENV GIT_BRANCH	master

WORKDIR /work

RUN git clone -b ${GIT_BRANCH} -- ${GIT_REPO} odp

WORKDIR odp

RUN ./bootstrap
RUN ./configure
RUN make
RUN make doxygen-html
RUN make install

