# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(APOPHIS_SOURCES
  99942_apophis.ssc
  data/99942_apophis.xyzv
  models/apophis.cmod
  models/apophis.cmod.license
)

install_to_extras_subdir("${DATADIR}" 99942_apophis ${APOPHIS_SOURCES})
