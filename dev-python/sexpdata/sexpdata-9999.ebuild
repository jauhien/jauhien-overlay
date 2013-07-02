# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{2_6,2_7,3_2})

inherit distutils-r1 git-2

DESCRIPTION="a simple S-expression parser/serializer"
HOMEPAGE="http://github.com/tkf/sexpdata"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="git://github.com/tkf/sexpdata.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
