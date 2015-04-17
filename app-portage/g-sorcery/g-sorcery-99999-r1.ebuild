# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{2_7,3_3,3_4})

inherit distutils-r1 git-2

DESCRIPTION="framework for ebuild generators"
HOMEPAGE="https://github.com/jauhien/g-sorcery"
SRC_URI=""
EGIT_BRANCH="dev"
EGIT_REPO_URI="https://github.com/jauhien/g-sorcery"

LICENSE="GPL-2"
SLOT="0"
IUSE="bson"

DEPEND="bson? ( dev-python/pymongo[$(python_gen_usedep 'python*')] )
	sys-apps/portage[$(python_gen_usedep 'python*')]"
PDEPEND=">=app-portage/layman-2.2.0[g-sorcery(-),$(python_gen_usedep 'python*')]"

python_test() {
	PYTHONPATH="." "${PYTHON}" scripts/run_tests.py
}

python_install_all() {
	distutils-r1_python_install_all

	doman docs/*.8
	dohtml docs/developer_instructions.html
	diropts -m0777
	dodir /var/lib/g-sorcery
}
