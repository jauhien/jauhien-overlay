# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

MYPN=TAUOLA

DESCRIPTION="tau decay Monte Carlo generator"
HOMEPAGE="http://tauolapp.web.cern.ch/tauolapp/"
SRC_URI="http://tauolapp.web.cern.ch/tauolapp/resources/${MYPN}.${PV}/${MYPN}.${PV}.tar.gz"
LICENSE="CPC GPL-2+"
#HepMC interface is licensed under GPL, other code under CPC

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples hepmc tau-spinner"

RDEPEND="hepmc? ( sci-physics/hepmc )
	tau-spinner? ( sci-physics/lhapdf )
"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen
		app-text/ghostscript-gpl
		app-text/texlive )
"

S="${WORKDIR}/${MYPN}"

src_prepare() {
	epatch "${FILESDIR}/${P}-makefile.patch" "${FILESDIR}/${P}-tau-spinner-makefile.patch"
}

src_configure() {
	econf \
		--without-mc-tester \
		--without-pythia8 \
		$(use_with hepmc hepmc "/usr") \
		$(use_with tau-spinner) \
		$(use_with tau-spinner lhapdf "/usr")
}

src_compile() {
	emake
	if use doc;
	then
		cd "${S}/documentation/doxy_documentation" || die
		make || die
		cd "${S}/documentation/latex_documentation" || die
		make || die
	fi
}

src_install() {
	emake PREFIX="${D}/usr" install

	if use doc; then
		dohtml documentation/doxy_documentation/html/*
		dodoc documentation/latex_documentation/Tauola_interface_design.pdf
	fi

	if use examples;
	then
		dodoc -r examples
		use tau-spinner && docinto tau-spinner && dodoc -r TauSpinner/examples
	fi
}
