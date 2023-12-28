# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(WARP_SOURCES
  warp.map
)

install(FILES ${WARP_SOURCES} DESTINATION "${DATADIR}/warp" COMPONENT core)
