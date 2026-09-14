inherit useradd systemd

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

USERADD_PACKAGES = "${PN}"
USERADD_PARAM:${PN} = "--system --home /var/lib/unbound --shell /sbin/nologin --user-group unbound"

SRC_URI += " \
    file://unbound.conf \
    file://forwarders.conf \
    file://unbound.service \
"

SYSTEMD_SERVICE:${PN} = "unbound.service"


SYSTEMD_AUTO_ENABLE = "disable;

do_install:append() {
    install -d ${D}${sysconfdir}/unbound
    install -m 0644 ${WORKDIR}/unbound.conf ${D}${sysconfdir}/unbound/unbound.conf
    install -m 0644 ${WORKDIR}/forwarders.conf ${D}${sysconfdir}/unbound/forwarders.conf

    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/unbound.service ${D}${systemd_unitdir}/system/unbound.service

    install -d ${D}${localstatedir}/lib/unbound
}

FILES:${PN} += " \
    ${sysconfdir}/unbound \
    ${localstatedir}/lib/unbound \
    ${systemd_unitdir}/system/unbound.service \
"
