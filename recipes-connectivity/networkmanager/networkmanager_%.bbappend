FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://dnsmasq-no-negcache.conf \
    file://debug-logging.conf \
"

EXTRA_OEMESON:append = " -Dmore_asserts=no"

do_install:append() {
    install -d ${D}${sysconfdir}
    install -d ${D}${sysconfdir}/NetworkManager/
    install -d ${D}${sysconfdir}/NetworkManager/conf.d/
    install -d ${D}${sysconfdir}/NetworkManager/dnsmasq.d/
    install -m 0644 ${WORKDIR}/dnsmasq-no-negcache.conf ${D}${sysconfdir}/NetworkManager/dnsmasq.d/dnsmasq-no-negcache.conf
    install -m 0644 ${WORKDIR}/debug-logging.conf ${D}${sysconfdir}/NetworkManager/conf.d/99-debug-logging.conf
}
