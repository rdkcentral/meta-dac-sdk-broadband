CFLAGS:append= " ${@bb.utils.contains_any("DISTRO_FEATURES", " wrynose", " -Wno-error=format-security", "", d)}"
