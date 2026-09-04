# Extension layer override for dnsmasq 2.90
# This bbappend in meta-rdk-oss-ext-middleware takes precedence over
# meta-rdk-oss-reference for faster release cycles

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-${PV}:${THISDIR}/${BPN}:"

SRC_URI:append:client = " \
    file://log-negative-upstream-DNS-replies.patch \
"
