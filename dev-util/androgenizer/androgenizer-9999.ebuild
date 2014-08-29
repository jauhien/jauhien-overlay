# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

DESCRIPTION="A tool for porting libtoolized software to Android"
HOMEPAGE="http://cgit.collabora.com/git/android/androgenizer.git/"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="git://git.collabora.co.uk/git/android/androgenizer.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}/${P}-Makefile.patch"
}
