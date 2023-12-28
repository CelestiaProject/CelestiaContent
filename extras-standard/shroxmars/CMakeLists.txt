# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(MARS_SOURCES
  models/marsglobalsurvr.3ds
  models/marsodyssey.3ds
  shroxmars.ssc
)

install_to_extras_subdir("${DATADIR}" shroxmars ${MARS_SOURCES})
