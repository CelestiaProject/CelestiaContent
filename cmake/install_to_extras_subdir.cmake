# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

macro(install_to_extras_subdir)
  if(${ARGC} LESS 3)
    message(FATAL_ERROR "install_to_extras_subdir requires at least 3 arguments")
  endif()

  set(__datadir   ${ARGV0})
  set(__subsubdir ${ARGV1})
  set(__sources   ${ARGV})
  list(REMOVE_AT __sources 0 1)

  foreach(file ${__sources})
    get_filename_component(dir ${file} DIRECTORY)
    install(FILES ${file} DESTINATION "${__datadir}/extras-standard/${__subsubdir}/${dir}" COMPONENT extras)
  endforeach()
endmacro()
