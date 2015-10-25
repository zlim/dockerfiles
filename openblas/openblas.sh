#!/bin/sh

DEBIAN_FRONTEND=noninteractive
apt-get -y update
apt-get -y install git-core build-essential gfortran checkinstall

TMP=/tmp
mkdir -p $TMP
cd $TMP

git clone -q --branch=master https://github.com/xianyi/OpenBLAS.git
(cd OpenBLAS && \
	make DYNAMIC_ARCH=1 NO_AFFINITY=1 USE_OPENMP=1 NUM_THREADS=32)
(cd OpenBLAS && \
	GITVER=g`git rev-parse --short HEAD`
	echo "OpenBLAS" > description-pak && \
	checkinstall -Dy --deldesc --nodoc --pakdir=$TMP \
		--pkgname=openblas \
		--pkggroup=openblas \
		--maintainer=zlim.lnx@gmail.com \
		--pkgrelease=$GITVER \
		--pkglicense=BSD \
		make install)
rm -rf OpenBLAS

echo "/opt/OpenBLAS/lib" > /etc/ld.so.conf.d/openblas.conf
ldconfig

apt-get -y remove --purge git-core build-essential checkinstall
apt-get -y autoremove
apt-get -y clean


