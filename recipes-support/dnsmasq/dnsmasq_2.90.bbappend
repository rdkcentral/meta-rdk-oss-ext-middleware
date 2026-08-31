# Extension layer override for dnsmasq 2.90
# This bbappend in meta-rdk-oss-ext-middleware takes precedence over
# meta-rdk-oss-reference for faster release cycles

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-${PV}:${THISDIR}/${BPN}:"

# Remove patches from base recipe and add only for broadband
SRC_URI:remove = " file://130-fingerprint-dhcp-lease-file-V2.90.patch \
                   file://client_notify.patch"

SRC_URI:append:broadband = " file://130-fingerprint-dhcp-lease-file-V2.90.patch \
                             file://client_notify.patch"
