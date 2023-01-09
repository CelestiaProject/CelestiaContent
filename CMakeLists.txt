cmake_minimum_required(VERSION 3.1.0)

project(celestia VERSION "1.7.0" LANGUAGES NONE)

option(ENABLE_NLS     "Enable object names translation? (Default: on)" ON)

# Use our cmake files
list(INSERT CMAKE_MODULE_PATH 0 "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(GNUInstallDirs)
include(install_to_extras_subdir)

if(ENABLE_NLS)
  find_package(Gettext)
  if(NOT GETTEXT_FOUND)
    message(WARNING "Gettext is not found, traslations won't be created.")
  endif()
  include(FixGettext)
endif()

if(WIN32)
  set(CMAKE_INSTALL_BINDIR ".")
  set(CMAKE_INSTALL_DATAROOTDIR ".")
  set(CMAKE_INSTALL_DATADIR ".")
  set(CMAKE_INSTALL_FULL_LOCALEDIR "locale")
  set(CMAKE_INSTALL_LOCALEDIR "${CMAKE_INSTALL_FULL_LOCALEDIR}")
  set(DATADIR "${CMAKE_INSTALL_DATADIR}")
  set(FULL_DATADIR ".")
else()
  set(DATADIR "${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}")
  set(FULL_DATADIR "${CMAKE_INSTALL_FULL_DATADIR}/${PROJECT_NAME}")
endif()

add_subdirectory(data)
add_subdirectory(extras)
add_subdirectory(extras-standard)
add_subdirectory(models)
add_subdirectory(po)
add_subdirectory(textures)
add_subdirectory(warp)
