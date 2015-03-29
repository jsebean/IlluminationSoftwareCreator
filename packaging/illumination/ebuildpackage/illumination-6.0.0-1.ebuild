# $Header: $

EAPI=4

DESCRIPTION="Illumination Software Creator allows you to quickily (and visually) build apps for Android, iOS, HTML5, Flash and Python/GTK.  Illumination generates raw source code (including XCode and Eclipse project files when necessary) for each platform -- making it an excellent rapid prototyping tool for native apps."
HOMEPAGE="http://www.lunduke.com"
SRC_URI="${PN}/${P}.tar.gz"
LICENSE="GPL2"
SLOT="0"
KEYWORDS="x86"
RDEPEND="dev-libs/popt"
DEPEND="${RDEPEND}"

src_configure() {
    econf --with-popt
}

src_install() {
    emake DESTDIR="${D}" install
    # Install README and (Debian) changelog
    dodoc README.md debian/changelog
}
