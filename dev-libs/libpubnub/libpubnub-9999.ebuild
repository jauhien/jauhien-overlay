# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-r3

DESCRIPTION="PubNub C library"
HOMEPAGE="http://github.com/pubnub/c"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="git://github.com/pubnub/c.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="=dev-libs/json-c-0.9*
	dev-libs/libevent
	dev-libs/openssl
	net-misc/curl
"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-Makefile.patch"
}

src_compile() {
	emake PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${D}" install
}
