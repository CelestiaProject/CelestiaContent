# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(HUBBLE_SOURCES
  hubble.ssc
  models/hubble.cmod
)

install_to_extras_subdir("${DATADIR}" hubble ${HUBBLE_SOURCES})
