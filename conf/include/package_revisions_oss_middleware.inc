PR:pn-libnetfilter-log ?= "r0"
PACKAGE_ARCH:pn-libnetfilter-log ?= "${OSS_LAYER_ARCH}"

PR:pn-libnfnetlink ?= "r0"
PACKAGE_ARCH:pn-libnfnetlink ?= "${OSS_LAYER_ARCH}"
# Eyil's transport patch and startup checks are validated against this release.
PREFERRED_VERSION_zeromq = "4.3.4"
