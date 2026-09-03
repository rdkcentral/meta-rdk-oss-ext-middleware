FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://dnsmasq-no-negcache.conf \
"

do_install:append() {
    install -d ${D}${sysconfdir}
    install -d ${D}${sysconfdir}/NetworkManager/
    install -d ${D}${sysconfdir}/NetworkManager/dnsmasq.d/
    install -m 0644 ${WORKDIR}/dnsmasq-no-negcache.conf ${D}${sysconfdir}/NetworkManager/dnsmasq.d/dnsmasq-no-negcache.conf
}
