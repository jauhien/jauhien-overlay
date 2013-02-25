# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="eselect module for leiningen"
HOMEPAGE="http://github.com/jauhien/jauhien-overlay"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-admin/eselect"

S=${WORKDIR}

src_install() {
	insinto /usr/share/eselect/modules
	doins "${FILESDIR}"/leiningen.eselect
}
