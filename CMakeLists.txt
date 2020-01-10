cmake_minimum_required(VERSION 3.1.0)

project(celestia VERSION "1.7.0" LANGUAGES NONE)

option(NATIVE_OSX_APP "Support native OSX paths read data from (Default: off)" OFF)

# Use our cmake files
list(INSERT CMAKE_MODULE_PATH 0 "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(GNUInstallDirs)
include(install_to_extras_subdir)

if(NATIVE_OSX_APP)
  set(CMAKE_INSTALL_PREFIX "${PROJECT_BINARY_DIR}/${PROJECT_NAME}.app/Contents")
  set(CMAKE_INSTALL_FULL_LOCALEDIR "${CMAKE_INSTALL_PREFIX}/Resources/locale")
  set(CMAKE_INSTALL_BINDIR "MacOS")
  set(DATADIR "${CMAKE_INSTALL_PREFIX}/Resources")
  set(FULL_DATADIR "${CMAKE_INSTALL_PREFIX}/Resources")
else()
  set(DATADIR "${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}")
  set(FULL_DATADIR "${CMAKE_INSTALL_FULL_DATADIR}/${PROJECT_NAME}")
endif()

add_subdirectory(data)
add_subdirectory(extras)
add_subdirectory(extras-standard)
add_subdirectory(models)
add_subdirectory(textures)
