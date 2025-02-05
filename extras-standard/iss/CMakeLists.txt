# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(ISS_SOURCES
  iss.ssc
  models/iss.cmod
  textures/medres/iss_01.png
  textures/medres/iss_02.png
  textures/medres/iss_03.png
  textures/medres/iss_04.png
  textures/medres/iss_05.png
  textures/medres/iss_06.png
  textures/medres/iss_07.png
  textures/medres/iss_08.png
  textures/medres/iss_09.png
  textures/medres/iss_10.png
  textures/medres/iss_11.png
  textures/medres/iss_12.png
  textures/medres/iss_13.png
)

install_to_extras_subdir("${DATADIR}" iss ${ISS_SOURCES})