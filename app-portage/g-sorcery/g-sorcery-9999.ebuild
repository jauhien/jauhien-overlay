# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{2_7,3_2,3_3})

inherit distutils-r1 git-2

DESCRIPTION="framework for ebuild generators"
HOMEPAGE="https://github.com/jauhien/g-sorcery"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/g-sorcery.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="=app-portage/layman-9999
	virtual/python-argparse"
RDEPEND="${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all

	doman docs/*.8
	dohtml docs/developer_instructions.html
	diropts -m0777
	dodir /var/lib/g-sorcery
}

pkg_postinst() {
	elog "Note that backends were splitted to another package"
	elog "emerge the one you need, e.g. gs-elpa"
}
