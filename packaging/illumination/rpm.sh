#!/bin/bash

APP=illumination
PREV_VERSION=6.0.0
VERSION=6.0.0
RELEASE=1
SOURCEDIR=.
ARCH_TYPE=`uname -m`
CURRDIR=`pwd`
SOURCE=~/rpmbuild/SOURCES/${APP}-${VERSION}.orig.tar.gz


# Update version numbers automatically - so you don't have to
sed -i 's/VERSION='${PREV_VERSION}'/VERSION='${VERSION}'/g' Makefile debian.sh arch.sh puppy.sh ebuild.sh
sed -i 's/Version: '${PREV_VERSION}'/Version: '${VERSION}'/g' rpmpackage/${APP}.spec
sed -i 's/Release: '${RELEASE}'/Release: '${RELEASE}'/g' rpmpackage/${APP}.spec
sed -i 's/pkgrel='${RELEASE}'/pkgrel='${RELEASE}'/g' archpackage/PKGBUILD
sed -i 's/pkgver='${PREV_VERSION}'/pkgver='${VERSION}'/g' archpackage/PKGBUILD
sed -i "s/-${PREV_VERSION}-/-${VERSION}-/g" puppypackage/pet.specs
sed -i "s/|${PREV_VERSION}|/|${VERSION}|/g" puppypackage/pet.specs

sudo yum groupinstall "Development Tools"
sudo yum install rpmdevtools

# setup the rpmbuild directory tree
rpmdev-setuptree

# create the source code in the SOURCES directory
make clean
mkdir -p ~/rpmbuild/SOURCES
rm -f ${SOURCE}
# having the root directory called name-version seems essential
mv ../${APP} ../${APP}-${VERSION}
tar -cvzf ${SOURCE} ../${APP}-${VERSION} --exclude-vcs
# rename the root directory without the version number
mv ../${APP}-${VERSION} ../${APP}

# copy the spec file into the SPECS directory
cp -f rpmpackage/${APP}.spec ~/rpmbuild/SPECS

# build
cd ~/rpmbuild/SPECS
rpmbuild -ba ${APP}.spec
cd ${CURRDIR}

# Copy the results into the rpmpackage directory
mkdir -p rpmpackage/${ARCH_TYPE}
cp -r ~/rpmbuild/RPMS/${ARCH_TYPE}/${APP}* rpmpackage/${ARCH_TYPE}
cp -r ~/rpmbuild/SRPMS/${APP}* rpmpackage
