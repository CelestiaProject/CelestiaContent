# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

file(GLOB MEDRES_SOURCES "*.jpg" "*.png" "*.dds" "*.license")

install(FILES ${MEDRES_SOURCES} DESTINATION "${DATADIR}/textures/medres" COMPONENT core)
