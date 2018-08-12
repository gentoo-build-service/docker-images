#!/bin/bash

set -e
set -x

mkdir -p /etc/portage/repos.conf/

echo '[gentoo-build-service]
location = /usr/local/overlay/gentoo-build-service
sync-type = git
sync-uri = https://github.com/gentoo-build-service/gentoo-overlay.git
auto-sync = yes' > /etc/portage/repos.conf/gentoo-build-service.conf
mkdir -p /etc/portage/package.keywords
echo "app-misc/gentoo-buildkit ~${ARCH}" > /etc/portage/package.keywords/99-buildservice.keywords
echo 'dev-libs/openssl -bindist' > /etc/portage/package.use/99-buildservice.use
echo "dev-libs/openssl -~${ARCH}" >> /etc/portage/package.keywords/99-buildservice.keywords
echo 'dev-python/shyaml ~amd64' >> /etc/portage/package.keywords/99-buildservice.keywords
emaint sync -r gentoo-build-service
emerge --quiet -j2 net-misc/openssh app-misc/gentoo-buildkit
rm -rf /setup.sh
