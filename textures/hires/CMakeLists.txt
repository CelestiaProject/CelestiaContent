# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

file(GLOB HIRES_IMAGES "*.jpg" "*.png" "*.dds")
file(GLOB HIRES_LICENSES "*.license")

install(FILES ${HIRES_IMAGES} DESTINATION "${DATADIR}/textures/hires" COMPONENT core)
install(FILES ${HIRES_LICENSES} DESTINATION "${DATADIR}/textures/hires" COMPONENT core)
install(FILES ${HIRES_LICENSES} DESTINATION "${DATADIR}/textures/medres" COMPONENT core)
install(FILES ${HIRES_LICENSES} DESTINATION "${DATADIR}/textures/lores" COMPONENT core)

add_custom_target(hires_downscale ALL)

foreach(IMG IN LISTS HIRES_IMAGES)
  CreateResizedTexture(hires_downscale "${IMG}" medres 2048)
  CreateResizedTexture(hires_downscale "${IMG}" lores 1024)
endforeach()
