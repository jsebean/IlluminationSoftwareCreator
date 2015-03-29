APP=illumination
VERSION=6.0.0
RELEASE=1
ARCH_TYPE=`uname -m`

all:
debug:
source:
	tar -cvzf ../$(APP)_$(VERSION).orig.tar.gz ../$(APP)-$(VERSION) --exclude-vcs
install:
	mkdir -p $(DESTDIR)/usr
	mkdir -p $(DESTDIR)/usr/bin
	mkdir -m 755 -p $(DESTDIR)/opt
	mkdir -m 755 -p $(DESTDIR)/usr
	mkdir -m 755 -p $(DESTDIR)/usr/bin
	mkdir -m 755 -p $(DESTDIR)/opt/RadicalBreeze
	mkdir -m 755 -p $(DESTDIR)/opt/RadicalBreeze/illumination
	mkdir -m 755 -p $(DESTDIR)"/opt/RadicalBreeze/illumination/illumination Libs"
	install -m 755 install/opt/RadicalBreeze/illumination/illumicon.png $(DESTDIR)/opt/RadicalBreeze/illumination/illumicon.png
	install -m 755 install/opt/RadicalBreeze/illumination/illumicon2.png $(DESTDIR)/opt/RadicalBreeze/illumination/illumicon2.png
	install -m 755 install/opt/RadicalBreeze/illumination/illumicon48.png $(DESTDIR)/opt/RadicalBreeze/illumination/illumicon48.png
	install -m 755 install/opt/RadicalBreeze/illumination/illumination $(DESTDIR)/opt/RadicalBreeze/illumination/illumination
	install -m 755 install/opt/RadicalBreeze/illumination/illumicon.xpm $(DESTDIR)/opt/RadicalBreeze/illumination/illumicon.xpm
	install -m 755 "install/opt/RadicalBreeze/illumination/illumination Libs/libRBAppearancePak.so" $(DESTDIR)"/opt/RadicalBreeze/illumination/illumination Libs/libRBAppearancePak.so"
	install -m 755 "install/opt/RadicalBreeze/illumination/illumination Libs/libRBShell.so" $(DESTDIR)"/opt/RadicalBreeze/illumination/illumination Libs/libRBShell.so"
	install -m 755 "install/opt/RadicalBreeze/illumination/illumination Libs/libREALSQLDatabase.so" $(DESTDIR)"/opt/RadicalBreeze/illumination/illumination Libs/libREALSQLDatabase.so"
	install -m 755 install/usr/bin/illumination $(DESTDIR)/usr/bin/illumination
	mkdir -m 755 -p $(DESTDIR)/usr/share
	mkdir -m 755 -p $(DESTDIR)/usr/share/man
	mkdir -m 755 -p $(DESTDIR)/usr/share/man/man1
	install -m 644 man/$(APP).1.gz $(DESTDIR)/usr/share/man/man1
	mkdir -m 755 -p $(DESTDIR)/usr/share/$(APP)
	mkdir -m 755 -p $(DESTDIR)/usr/share/applications
	mkdir -m 755 -p $(DESTDIR)/usr/share/pixmaps
	mkdir -m 755 -p $(DESTDIR)/usr/share/icons
	mkdir -m 755 -p $(DESTDIR)/usr/share/icons/hicolor
	mkdir -m 755 -p $(DESTDIR)/usr/share/icons/hicolor/scalable
	mkdir -m 755 -p $(DESTDIR)/usr/share/icons/hicolor/scalable/apps
	mkdir -m 755 -p $(DESTDIR)/usr/share/icons/hicolor/24x24
	mkdir -m 755 -p $(DESTDIR)/usr/share/icons/hicolor/24x24/apps
	install -m 644 desktop/$(APP).desktop $(DESTDIR)/usr/share/applications/$(APP).desktop
	install -m 644 desktop/icon24.png $(DESTDIR)/usr/share/icons/hicolor/24x24/apps/$(APP).png
	install -m 644 desktop/icon.svg $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/$(APP).svg
	install -m 644 desktop/icon.svg $(DESTDIR)/usr/share/pixmaps/$(APP).svg
clean:
	rm -f $(APP) \#* \.#* gnuplot* *.png debian/*.substvars debian/*.log
	rm -fr deb.* debian/$(APP) rpmpackage/$(ARCH_TYPE)
	rm -f ../$(APP)*.deb ../$(APP)*.changes ../$(APP)*.asc ../$(APP)*.dsc
	rm -f rpmpackage/*.src.rpm archpackage/*.gz puppypackage/*.gz puppypackage/*.pet
