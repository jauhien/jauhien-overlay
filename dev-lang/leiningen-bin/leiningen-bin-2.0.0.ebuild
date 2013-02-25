# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Clojure projects manager with bundled clojure"
HOMEPAGE="http://leiningen.org/"
SRC_URI="http://leiningen.s3.amazonaws.com/downloads/leiningen-${PV}-standalone.jar
	https://raw.github.com/technomancy/leiningen/${PV}/bin/lein-pkg -> lein-bin"

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
	dobin lein-bin
	dosym /usr/bin/lein-bin /usr/bin/lein
	into /opt/${PN}-${SLOT}
	dolib leiningen-${PV}-standalone.jar
}
