# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{3_2,3_3})

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

DEPEND="dev-python/sexpdata"
RDEPEND="${DEPEND}"
