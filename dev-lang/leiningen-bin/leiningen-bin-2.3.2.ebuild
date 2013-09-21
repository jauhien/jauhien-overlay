# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils java-utils-2

DESCRIPTION="Clojure projects manager with bundled clojure"
HOMEPAGE="http://leiningen.org/"
SRC_URI="http://leiningen.s3.amazonaws.com/downloads/leiningen-${PV}-standalone.jar
	https://raw.github.com/technomancy/leiningen/${PV}/bin/lein-pkg -> lein-bin-${PV}"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jre-1.5.0"
RDEPEND="${DEPEND}
	app-admin/eselect-leiningen"

src_unpack() {
	mkdir -p "${S}" || die
	cp "${DISTDIR}"/* "${S}" || die
}

src_prepare() {
	epatch "${FILESDIR}/${P}-path.patch"
}

src_install() {
	dobin lein-bin-${PV}
	dosym /usr/bin/lein-bin-${PV} /usr/bin/lein
	into /opt
	java-pkg_dojar leiningen-${PV}-standalone.jar
}
