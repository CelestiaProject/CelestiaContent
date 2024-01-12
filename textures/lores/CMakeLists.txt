# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

file(GLOB LORES_SOURCES "*.jpg" "*.png" "*.dds" "*.license")

install(FILES ${LORES_SOURCES} DESTINATION "${DATADIR}/textures/lores" COMPONENT core)
