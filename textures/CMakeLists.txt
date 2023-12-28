# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

file(GLOB TEXTURES_SOURCES "*.jpg" "*.png")

install(FILES ${TEXTURES_SOURCES} DESTINATION "${DATADIR}/textures" COMPONENT core)

add_subdirectory(hires)
add_subdirectory(medres)
add_subdirectory(lores)
