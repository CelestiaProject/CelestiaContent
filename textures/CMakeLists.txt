# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

file(GLOB TEXTURES_SOURCES "*.jpg" "*.png" "*.license")

install(FILES ${TEXTURES_SOURCES} DESTINATION "${DATADIR}/textures" COMPONENT core)

function(CreateResizedTexture target imgfile sizedir maxdim)
  get_filename_component(BASE_NAME "${imgfile}" NAME)
  set(OUTPUT_PATH "${CMAKE_CURRENT_BINARY_DIR}/${sizedir}_${BASE_NAME}")
  set(INSTALL_PATH "${DATADIR}/textures/${sizedir}")

  add_custom_command(
    OUTPUT "${OUTPUT_PATH}"
    COMMAND
      "${CMAKE_COMMAND}"
      "-DINPUT_PATH=${imgfile}"
      "-DOUTPUT_PATH=${OUTPUT_PATH}"
      "-DMAXDIM=${maxdim}"
      "-DImageMagick_magick_EXECUTABLE=${ImageMagick_magick_EXECUTABLE}"
      "-DImageMagick_convert_EXECUTABLE=${ImageMagick_convert_EXECUTABLE}"
      "-DImageMagick_identify_EXECUTABLE=${ImageMagick_identify_EXECUTABLE}"
      -P "${PROJECT_SOURCE_DIR}/cmake/ResizeImage.cmake"
    DEPENDS "${imgfile}"
    VERBATIM
  )

  install(FILES "${OUTPUT_PATH}" DESTINATION "${DATADIR}/textures/${sizedir}" RENAME "${BASE_NAME}" COMPONENT core)

  get_property(currentCounter GLOBAL PROPERTY "_RESIZE_UNIQUE_COUNTER")
  if(NOT currentCounter)
    set(currentCounter 1)
  endif()
  set(UNIQUE_TARGET "_resize_file_${currentCounter}")
  math(EXPR currentCounter "${currentCounter} + 1")
  set_property(GLOBAL PROPERTY "_RESIZE_UNIQUE_COUNTER" ${currentCounter})

  add_custom_target(${UNIQUE_TARGET} DEPENDS "${OUTPUT_PATH}")
  add_dependencies(${target} ${UNIQUE_TARGET})
endfunction()

add_subdirectory(hires)
add_subdirectory(medres)
add_subdirectory(lores)
