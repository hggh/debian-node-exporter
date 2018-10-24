#!/bin/bash

source CONFIG

mkdir build
cd build 
wget $URL
tar xvfz node_exporter*.tar.gz
cd ..

fpm --deb-default etc/default/node_exporter \
  --deb-systemd etc/systemd/system/node_exporter.service \
  -s dir -t deb -n node-exporter \
  -v $VERSION-${DEB_VERSION} \
  usr build/node_exporter-${VERSION}.linux-amd64/node_exporter=usr/bin/ var

