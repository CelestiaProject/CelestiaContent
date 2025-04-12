# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

cmake_minimum_required(VERSION 3.8)

# Normalize install(DESTINATION) paths
if(POLICY CMP0177)
  cmake_policy(SET CMP0177 NEW)
endif()

# set languages to C to stop GNUInstallDirs from complaining
project(celestia VERSION "1.7.0" LANGUAGES C)

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

find_package(ImageMagick COMPONENTS magick)
if(NOT ImageMagick_magick_FOUND)
  find_package(ImageMagick COMPONENTS convert identify REQUIRED)
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
add_subdirectory(models-extra)
add_subdirectory(po)
add_subdirectory(textures)
add_subdirectory(warp)
