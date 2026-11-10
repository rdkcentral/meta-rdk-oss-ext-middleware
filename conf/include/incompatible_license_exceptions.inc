# Copyright 2026 RDK Management
# SPDX-License-Identifier: Apache-2.0

# Eyil uses libzmq in runtime images and development SDKs. Keep this exception
# visible to both recipe parsing and image license checks.
INCOMPATIBLE_LICENSE_EXCEPTIONS:append = " \
    ${MLPREFIX}zeromq:LGPL-3.0-or-later \
    ${MLPREFIX}zeromq-src:LGPL-3.0-or-later \
    ${MLPREFIX}zeromq-dbg:LGPL-3.0-or-later \
    ${MLPREFIX}zeromq-staticdev:LGPL-3.0-or-later \
    ${MLPREFIX}zeromq-dev:LGPL-3.0-or-later \
    ${MLPREFIX}zeromq-doc:LGPL-3.0-or-later \
    ${MLPREFIX}zeromq-locale:LGPL-3.0-or-later \
    ${MLPREFIX}zeromq-lic:LGPL-3.0-or-later \
    ${MLPREFIX}zeromq-ptest:LGPL-3.0-or-later \
"
