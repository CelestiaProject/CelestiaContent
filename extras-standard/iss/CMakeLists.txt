# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(ISS_SOURCES
  iss.ssc
  textures/medres/issmod.jpg
  textures/medres/issbso2.jpg
  textures/medres/isspanel.jpg
  textures/medres/issb2.jpg
  textures/medres/issku2.jpg
  textures/medres/isscup.jpg
  textures/medres/isszmod.jpg
  textures/medres/metalcon.jpg
  textures/medres/issesa.jpg
  textures/medres/issp2.jpg
  textures/medres/issusa.jpg
  textures/medres/iss_dcs.jpg
  textures/medres/issins.jpg
  textures/medres/issbso.jpg
  textures/medres/d_ring.jpg
  textures/medres/questcov.jpg
  textures/medres/issbs.jpg
  textures/medres/issb.jpg
  textures/medres/iss_un.jpg
  textures/medres/isscover.jpg
  textures/medres/iss_dc.jpg
  textures/medres/issrad.jpg
  textures/medres/isssolar.jpg
  textures/medres/issb4.jpg
  textures/medres/graple.jpg
  textures/medres/issred.jpg
  textures/medres/isshand.jpg
  textures/medres/issku1.jpg
  textures/medres/isscov2.jpg
  textures/medres/issmb.jpg
  textures/medres/nasda.jpg
  textures/medres/issdish.jpg
  textures/medres/issb3.jpg
  textures/medres/issdot.jpg
  textures/medres/issku.jpg
  textures/medres/issusaf.jpg
  models/iss.cmod
)

install_to_extras_subdir("${DATADIR}" iss ${ISS_SOURCES})
