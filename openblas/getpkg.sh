#!/bin/sh

ID=$(docker run -d -i zlim/openblas)
docker exec $ID sh -c 'mv /tmp/openblas*.deb /tmp/openblas.deb; ls /tmp'
docker cp $ID:/tmp/openblas.deb .
docker rm -f $ID

