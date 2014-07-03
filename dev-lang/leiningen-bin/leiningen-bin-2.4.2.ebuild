# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils java-utils-2

DESCRIPTION="Clojure projects manager with bundled clojure"
HOMEPAGE="http://leiningen.org/"
SRC_URI="https://github.com/technomancy/leiningen/releases/download/${PV}/leiningen-${PV}-standalone.jar
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
	sed -i -e 's%for f in "$LEIN_HOME/leinrc" ".leinrc"; do%for f in "/etc/leinrc" "$HOME/.leinrc"; do%' lein-bin-* || die
	sed -i -e 's%LEIN_JAR=/usr/share/java/leiningen-$LEIN_VERSION-standalone.jar%LEIN_JAR=/opt/leiningen-bin-0/leiningen-bin.jar%' lein-bin-* || die
}

src_install() {
	dobin lein-bin-${PV}
	dosym /usr/bin/lein-bin-${PV} /usr/bin/lein
	java-pkg_jarinto /opt/${PN}-${SLOT}
	java-pkg_newjar leiningen-${PV}-standalone.jar ${PN}.jar
}
