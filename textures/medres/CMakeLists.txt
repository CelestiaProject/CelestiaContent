# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

file(GLOB MEDRES_IMAGES "*.jpg" "*.png" "*.dds")
file(GLOB MEDRES_LICENSES "*.license")

install(FILES ${MEDRES_IMAGES} DESTINATION "${DATADIR}/textures/medres" COMPONENT core)
install(FILES ${MEDRES_LICENSES} DESTINATION "${DATADIR}/textures/medres" COMPONENT core)
install(FILES ${MEDRES_LICENSES} DESTINATION "${DATADIR}/textures/lores" COMPONENT core)

add_custom_target(medres_downscale ALL)

foreach(IMG IN LISTS MEDRES_IMAGES)
  if(NOT IMG MATCHES "normal")
    CreateResizedTexture(medres_downscale "${IMG}" lores 1024)
  endif()
endforeach()
