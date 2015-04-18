# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{2_7,3_3,3_4})

inherit distutils-r1 git-2

DESCRIPTION="g-sorcery backend for pypi packages"
HOMEPAGE="https://github.com/jauhien/gs-pypi"
SRC_URI=""
EGIT_BRANCH="dev"
EGIT_REPO_URI="http://github.com/jauhien/gs-pypi"

LICENSE="GPL-2"
SLOT="0"

DEPEND=">=app-portage/g-sorcery-99999[bson(-),$(python_gen_usedep 'python*')]
	dev-python/beautifulsoup:4[$(python_gen_usedep 'python*')]"
RDEPEND="${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all
	doman docs/*.8
}
