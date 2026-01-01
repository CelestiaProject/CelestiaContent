# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(MIR_SOURCES
  mir.ssc
  models/mir.cmod
  models/mir.cmod.license
  textures/medres/chrome.png
  textures/medres/chrome.png.license
  textures/medres/dock.png
  textures/medres/dock.png.license
  textures/medres/docking_ring.png
  textures/medres/docking_ring.png.license
  textures/medres/dockkr.png
  textures/medres/dockkr.png.license
  textures/medres/metallwhite.png
  textures/medres/metallwhite.png.license
  textures/medres/mir.png
  textures/medres/mir.png.license
  textures/medres/multi.png
  textures/medres/multi.png.license
  textures/medres/ODS_collar.png
  textures/medres/ODS_collar.png.license
  textures/medres/paneliss3.png
  textures/medres/paneliss3.png.license
)

install_to_extras_subdir("${DATADIR}" mir ${MIR_SOURCES})
