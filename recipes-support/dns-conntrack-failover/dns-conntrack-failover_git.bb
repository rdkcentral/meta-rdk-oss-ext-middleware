SUMMARY = "DNS conntrack failover detector"
DESCRIPTION = "Monitors DNS reachability"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=06093b681f6d882a55e3bc222a02a988"

SRC_URI = "git://github.com/rdkcentral/test-and-diagnostic.git;protocol=https;branch=topic/RDK-62226"
SRCREV = "bbc90ecd96988e2a62db49b918aefd8f54686efb"

PV = "0.1"
S = "${WORKDIR}/git"

DEPENDS = "libnetfilter-conntrack libnfnetlink"

inherit systemd syslog-ng-config-gen logrotate_config

SRC_URI += "file://dns-conntrack-failover.service"

SYSTEMD_SERVICE:${PN} = "dns-conntrack-failover.service"
SYSTEMD_AUTO_ENABLE = "disable"

CONNTRACK_SRC = "${S}/source/DnsConntrackFailover/dns_conntrack_failover.c"

do_compile() {
    ${CC} ${CFLAGS} ${LDFLAGS} -DPLATFORM_RDKV=1 \
        ${CONNTRACK_SRC} \
        -o dns_conntrack_failover \
        -lnetfilter_conntrack -lnfnetlink -lpthread
}

SYSLOG-NG_FILTER:append = " dns_failover"
SYSLOG-NG_SERVICE_dns_failover = "dns-conntrack-failover.service"
SYSLOG-NG_DESTINATION_dns_failover = "dns_failover.log"
SYSLOG-NG_LOGRATE_dns_failover = "low"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 dns_conntrack_failover ${D}${bindir}/dns_conntrack_failover

    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/dns-conntrack-failover.service \
        ${D}${systemd_unitdir}/system/dns-conntrack-failover.service
}

FILES:${PN} += " \
    ${bindir}/dns_conntrack_failover \
    ${systemd_unitdir}/system/dns-conntrack-failover.service \
"
