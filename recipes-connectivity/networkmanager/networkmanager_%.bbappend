FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://dnsmasq-no-negcache.conf \
    file://networkmanager-handler.conf \
    file://nm_interface_handler.sh \
"

do_install:append() {
    install -d ${D}${sysconfdir}
    install -d ${D}${sysconfdir}/NetworkManager/
    install -d ${D}${sysconfdir}/NetworkManager/dnsmasq.d/
    install -m 0644 ${WORKDIR}/dnsmasq-no-negcache.conf ${D}${sysconfdir}/NetworkManager/dnsmasq.d/dnsmasq-no-negcache.conf
    install -Dm 0644 ${WORKDIR}/networkmanager-handler.conf ${D}${systemd_system_unitdir}/NetworkManager.service.d/10-rdk-iface-handler.conf
    install -Dm 0755 ${WORKDIR}/nm_interface_handler.sh ${D}${base_libdir}/rdk/nm_interface_handler.sh
}

FILES:${PN}-daemon:append = " ${systemd_system_unitdir}/NetworkManager.service.d/10-rdk-iface-handler.conf ${base_libdir}/rdk/nm_interface_handler.sh"
