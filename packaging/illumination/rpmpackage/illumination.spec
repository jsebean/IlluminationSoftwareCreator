Name: illumination
Version: 6.0.0
Release: 1%{?dist}
Summary: Visual App Creation for Android, iOS, HTML5, PyGTK and Flash
License: GPL2
URL: http://www.lunduke.com
Packager: Bob Mottram (4096 bits) <bob@robotics.uk.to>
Source0: http://yourdomainname.com/src/%{name}_%{version}.orig.tar.gz
Group: Development/IDE
Requires: glibc expat glib2 gtk2 expat-devel

%description
Illumination Software Creator allows you to quickily (and visually) build
apps for Android, iOS, HTML5, Flash and Python/GTK.  Illumination generates
raw source code (including XCode and Eclipse project files when necessary)
for each platform -- making it an excellent rapid prototyping tool for
native apps.

%prep
%setup -q

%build
%configure
make %{?_smp_mflags}

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}
mkdir -p %{buildroot}/etc
mkdir -p %{buildroot}/etc/%{name}
mkdir -p %{buildroot}/usr
mkdir -p %{buildroot}/usr/bin
mkdir -p "%{buildroot}/opt"
mkdir -p "%{buildroot}/usr"
mkdir -p "%{buildroot}/usr/bin"
mkdir -p "%{buildroot}/opt/RadicalBreeze"
mkdir -p "%{buildroot}/opt/RadicalBreeze/illumination"
mkdir -p "%{buildroot}/opt/RadicalBreeze/illumination/illumination Libs"
mkdir -p %{buildroot}/usr/share
mkdir -p %{buildroot}/usr/share/man
mkdir -p %{buildroot}/usr/share/man/man1
mkdir -p %{buildroot}/usr/share/%{name}
mkdir -p %{buildroot}/usr/share/applications
mkdir -p %{buildroot}/usr/share/icons
mkdir -p %{buildroot}/usr/share/icons/hicolor
mkdir -p %{buildroot}/usr/share/icons/hicolor/24x24
mkdir -p %{buildroot}/usr/share/icons/hicolor/24x24/apps

mkdir -p %{buildroot}/usr/share/pixmaps
mkdir -p %{buildroot}/usr/share/icons/hicolor/scalable
mkdir -p %{buildroot}/usr/share/icons/hicolor/scalable/apps
# Make install but to the RPM BUILDROOT directory
make install -B DESTDIR=%{buildroot}

%files
%doc README.md LICENSE
%defattr(-,root,root,-)
%dir /opt
%dir /usr
%dir /usr/bin
%dir /opt/RadicalBreeze
%dir /opt/RadicalBreeze/illumination
%dir "/opt/RadicalBreeze/illumination/illumination Libs"
%dir /usr/share/%{name}
%dir /usr/share/applications
%dir /usr/share/icons/hicolor
%dir /usr/share/icons/hicolor/24x24
%dir /usr/share/icons/hicolor/24x24/apps
%dir /usr/share/pixmaps
%dir /usr/share/icons/hicolor/scalable
%dir /usr/share/icons/hicolor/scalable/apps
%{_bindir}/*
%{_mandir}/man1/*
%attr(644,root,root) /usr/share/applications/%{name}.desktop
%attr(644,root,root) /usr/share/icons/hicolor/24x24/apps/%{name}.png
%attr(644,root,root) /usr/share/icons/hicolor/scalable/apps/%{name}.svg
%attr(644,root,root) /usr/share/pixmaps/%{name}.svg
%attr(755,root,root) /opt/RadicalBreeze/illumination/illumicon.png
%attr(755,root,root) /opt/RadicalBreeze/illumination/illumicon2.png
%attr(755,root,root) /opt/RadicalBreeze/illumination/illumicon48.png
%attr(755,root,root) /opt/RadicalBreeze/illumination/illumination
%attr(755,root,root) /opt/RadicalBreeze/illumination/illumicon.xpm
%attr(755,root,root) "/opt/RadicalBreeze/illumination/illumination Libs/libRBAppearancePak.so"
%attr(755,root,root) "/opt/RadicalBreeze/illumination/illumination Libs/libRBShell.so"
%attr(755,root,root) "/opt/RadicalBreeze/illumination/illumination Libs/libREALSQLDatabase.so"
%attr(755,root,root) /usr/bin/illumination

%changelog
* Sat Jun 29 2013  Bob Mottram (4096 bits) <bob@robotics.uk.to>
- Spec file created
