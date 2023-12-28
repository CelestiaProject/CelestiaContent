# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(SKYLAB_SOURCES
  models/skylab.3ds
  skylab.ssc
)

install_to_extras_subdir("${DATADIR}" skylab ${SKYLAB_SOURCES})
