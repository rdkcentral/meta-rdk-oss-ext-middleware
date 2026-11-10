# Copyright 2026 RDK Management
# SPDX-License-Identifier: Apache-2.0

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://zmq_connection_lifetime.patch"
PR:append = ".eyil1"

# Eyil requires the patched version-2 monitor and connection lifetime metadata.
EXTRA_OECMAKE:append = " -DENABLE_DRAFTS=ON"
