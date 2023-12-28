# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(MIR_SOURCES
  models/mir.3ds
  mir.ssc
)

install_to_extras_subdir("${DATADIR}" mir ${MIR_SOURCES})
