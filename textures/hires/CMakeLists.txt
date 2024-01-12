# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

file(GLOB HIRES_SOURCES "*.jpg" "*.png" "*.dds" "*.license")

install(FILES ${HIRES_SOURCES} DESTINATION "${DATADIR}/textures/hires" COMPONENT core)
