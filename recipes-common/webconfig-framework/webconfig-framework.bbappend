CFLAGS += " -Wno-error=unused-result -Wno-error=stringop-truncation"
CFLAGS:append:wrynose = " \
    -Wno-error=incompatible-pointer-types \
"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:wrynose = " file://fix_rollbackFunc_wrynose.patch;apply=no"
do_webconfig_patch () {
    cd ${S}
    if [ ! -e patch_applied ]; then
        if ${@bb.utils.contains('DISTRO_FEATURES', 'wrynose', 'true', 'false', d)}; then
             patch -p1 < ${UNPACKDIR}/fix_rollbackFunc_wrynose.patch
             touch patch_applied
        fi
    fi
}
addtask webconfig_patch after do_unpack before do_configure

