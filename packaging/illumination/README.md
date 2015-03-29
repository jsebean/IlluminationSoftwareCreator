How to Package ISC
==================

Preparation
-----------

1. Create your binaries (libraries and the main executable) using the IDE, then copy them into the "install" directory using whatever is the desired directory structure.  Typically this is:

    opt/RadicalBreeze/illumination

If you're using any other directory structure then you will either need to edit all the directories within Makefile, debian/rules and rpmpackage/illumination.spec (seems like a lot of work), or see the generate.sh script for how to generate these files using packagemonkey.

If you added or removed any extra binary files or libraries then make sure that debian/source/include-binaries is updated accordingly, otherwise creation of Debian packages will fail.

2. install/usr/bin/illumination is a script which calls the main executable, so make sure that the path is set correctly within that file.

3. Edit the changelog file debian/changelog.  The latest entry must be at the top of the file and must be in a very particular format as dictated by the Debian standards.  The email address must exactly correspond to that of your GPG key (yes you need one of those to sign the package).

For details of the Debian changelog format see http://www.debian.org/doc/debian-policy/ch-source.html#s-dpkgchangelog

4. Update the changelog within rpmpackage/illumination.spec.  In general lines should be no longer than 76 characters.


On Debian based systems
-----------------------

Edit the debian.sh script and make sure that VERSION is set to the current version of the software.  The sed statements within that script will try to automatically update version numbers elsewhere to avoid duplicated effort.

Move to the packaging/illumination directory, then run the debian.sh script.

If necessary:

    chmod +x debian.sh

then

    ./debian.sh

If you're using Open Build Service then upload the following files:

    illumination_version.orig.tar.gz
    illumination_version.orig.tar.gz.asc
    illumination_version-1.debian.tar.gz
    illumination_version-1.dsc


On RPM based systems
--------------------

Edit the rpm.sh script and make sure that VERSION is set to the current version of the software.  The sed statements within that script will try to automatically update version numbers elsewhere to avoid duplicated effort.

Move to the packaging/illumination directory, then run the rpm.sh script.

If necessary:

    chmod +x rpm.sh

then

    ./rpm.sh

If you're using Open Build Service then upload the following files:

    illumination.spec
    illumination_version.orig.tar.gz


Arch/Pacman based systems
-------------------------

Edit the arch.sh script and make sure that VERSION is set to the current version of the software.  The sed statements within that script will try to automatically update version numbers elsewhere to avoid duplicated effort.

Move to the packaging/illumination directory, then run the arch.sh script.

If necessary:

    chmod +x arch.sh

then

    ./arch.sh

If you're using Open Build Service then upload the following files:

    PKGBUILD
    illumination-version.tar.gz


Puppy Linux
-----------

Edit the puppy.sh script and make sure that VERSION is set to the current version of the software.  The sed statements within that script will try to automatically update version numbers elsewhere to avoid duplicated effort.

Move to the packaging/illumination directory, then run the puppy.sh script.

If necessary:

    chmod +x puppy.sh

then

    ./puppy.sh

The resulting PET should appear within the subdirectory called puppypackage.


Miscellaneous
-------------

Note that the configure file is deliberately left empty.  Without this file RPM packages will refuse to build.
