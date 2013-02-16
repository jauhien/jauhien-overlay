# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{3_2,3_3})

inherit distutils-r1 git-2

DESCRIPTION="g-common repositories manager"
HOMEPAGE="http://github.com/jauhien/common"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="git://github.com/jauhien/g-common.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-portage/layman"
RDEPEND="${DEPEND}"
