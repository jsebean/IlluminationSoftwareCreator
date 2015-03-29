#!/bin/bash

APP=illumination
PREV_VERSION=6.0.0
VERSION=6.0.0
RELEASE=1
ARCH_TYPE=`uname -m`
DIR=${APP}-${VERSION}

if [ $ARCH_TYPE == "x86_64" ]; then
    ARCH_TYPE="amd64"
fi
if [ $ARCH_TYPE == "i686" ]; then
    ARCH_TYPE="i386"
fi

#update version numbers automatically - so you don't have to
sed -i 's/VERSION='${PREV_VERSION}'/VERSION='${VERSION}'/g' Makefile rpm.sh
sed -i 's/Version: '${PREV_VERSION}'/Version: '${VERSION}'/g' rpmpackage/${APP}.spec
sed -i 's/Release: '${RELEASE}'/Release: '${RELEASE}'/g' rpmpackage/${APP}.spec

make clean
make

# change the parent directory name to debian format
mv ../${APP} ../${DIR}

# Create a source archive
make source

# Build the package
dpkg-buildpackage -F

# sign files
gpg -ba ../${APP}_${VERSION}-1_${ARCH_TYPE}.deb
gpg -ba ../${APP}_${VERSION}.orig.tar.gz

# restore the parent directory name
mv ../${DIR} ../${APP}
