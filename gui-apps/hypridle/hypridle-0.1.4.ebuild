# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Hyprland's idle daemon"
HOMEPAGE="https://github.com/hyprwm/hypridle"

if [[ "${PV}" = *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hyprwm/${PN^}.git"
else
	SRC_URI="https://github.com/hyprwm/${PN^}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0"

RDEPEND="
	>=dev-cpp/sdbus-c++-2.0.0
	>=dev-libs/hyprlang-0.4.0
	dev-libs/wayland
	>=gui-libs/hyprutils-0.2.0
"
DEPEND="
	${RDEPEND}
	dev-libs/wayland-protocols
"

BDEPEND="
	dev-util/wayland-scanner
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/hypridle-0.1.4-fix-CFLAGS-CXXFLAGS.patch"
)
