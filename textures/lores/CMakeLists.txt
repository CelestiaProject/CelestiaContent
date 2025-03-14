# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

file(GLOB LORES_IMAGES "*.jpg" "*.png" "*.dds")
file(GLOB LORES_LICENSES "*.license")

install(FILES ${LORES_IMAGES} DESTINATION "${DATADIR}/textures/lores" COMPONENT core)
install(FILES ${LORES_LICENSES} DESTINATION "${DATADIR}/textures/lores" COMPONENT core)
