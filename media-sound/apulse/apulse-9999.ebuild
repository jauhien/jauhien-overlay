# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 cmake-multilib

DESCRIPTION="PulseAudio emulation for ALSA"
HOMEPAGE="https://github.com/i-rinat/apulse"
EGIT_REPO_URI="https://github.com/i-rinat/apulse"

LICENSE="MIT LGPL-2.1"
SLOT="0"

KEYWORDS=""

DEPEND="media-libs/alsa-lib[${MULTILIB_USEDEP}]
	dev-libs/glib:2
	!media-sound/pulseaudio
	amd64? ( abi_x86_32? (
		!app-emulation/emul-linux-x86-soundlibs[-abi_x86_32(-)]
		!app-emulation/emul-linux-x86-soundlibs[abi_x86_32(-),pulseaudio(-)]
		|| (
			dev-libs/glib:2[abi_x86_32(-)]
			app-emulation/emul-linux-x86-baselibs[-abi_x86_32(-)]
		)
	) )
"
RDEPEND="${DEPEND}"

MULTILIB_CHOST_TOOLS=( /usr/bin/apulse )

multilib_src_configure() {
	local mycmakeargs="-DAPULSEPATH=${EPREFIX}/usr/$(get_libdir)/apulse"

	cmake-utils_src_configure
}
