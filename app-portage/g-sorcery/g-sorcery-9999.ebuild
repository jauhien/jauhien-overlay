# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{2_7,3_2,3_3})

inherit distutils-r1 git-2

DESCRIPTION="g-sorcery"
HOMEPAGE="http://git.overlays.gentoo.org/gitweb/?p=proj/g-sorcery.git;a=summary"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/g-sorcery.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="=app-portage/layman-9999
	dev-python/beautifulsoup:4
	dev-python/sexpdata
	virtual/python-argparse"
RDEPEND="${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all

	doman docs/*.8
	dohtml docs/developer_instructions.html
}
