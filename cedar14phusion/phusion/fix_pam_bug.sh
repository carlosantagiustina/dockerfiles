#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

# Fixes https://github.com/docker/docker/issues/6345
# The Github is closed, but some apps such as pbuilder still triggers it.

export CONFIGURE_OPTS=--disable-audit
cd /tmp

$minimal_apt_get_install gdebi-core
apt-get build-dep -y --no-install-recommends pam
apt-get source -y -b pam
gdebi -n libpam-doc*.deb libpam-modules*.deb libpam-runtime*.deb libpam0g*.deb
rm -rf *.deb *.gz *.dsc *.changes pam-*

# Unfortunately there is no way to automatically remove build deps, so we do this manually.
apt-get remove -y autopoint bsdmainutils debhelper dh-apparmor dh-autoreconf diffstat \
  docbook-xml docbook-xsl flex gettext gettext-base intltool-debian \
  libasprintf0c2 libaudit-dev libcrack2 libcrack2-dev libdb-dev libdb5.3-dev \
  libfl-dev libgc1c2 libgpm2 libpipeline1 libselinux1-dev libsepol1-dev \
  libunistring0 libxml2-utils man-db po-debconf quilt sgml-data w3m xsltproc 

apt-get remove -y gdebi-core
apt-get autoremove -y
