# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(INTERSTELLAR_SOURCES
  data/borisov.xyzv
  data/oumuamua.xyzv
  interstellar-objects.ssc
)

install_to_extras_subdir("${DATADIR}" interstellar-objects ${INTERSTELLAR_SOURCES})
