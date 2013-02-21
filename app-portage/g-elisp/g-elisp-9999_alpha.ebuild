# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{3_2,3_3})

inherit distutils-r1 git-2

DESCRIPTION="Driver for g-common repository of emacs packages"
HOMEPAGE="http://github.com/jauhien/g-elisp"
SRC_URI=""
EGIT_BRANCH="dev"
EGIT_REPO_URI="git://github.com/jauhien/g-elisp.git"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="app-editors/emacs
		app-portage/g-common"
RDEPEND="${DEPEND}"
