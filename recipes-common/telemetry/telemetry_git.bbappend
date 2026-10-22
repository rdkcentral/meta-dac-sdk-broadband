CFLAGS += " -Wno-error=unused-result -Wno-error=stringop-truncation"
DEPENDS += " webconfig-framework "
CFLAGS:append:wrynose = " \
    -Wno-discarded-qualifiers \
"
do_configure:prepend:wrynose() {
    find ${S} -type f \( -name Makefile.am \) -exec sed -i 's/-lmsgpackc/-lmsgpack-c/g' {} \;
}

