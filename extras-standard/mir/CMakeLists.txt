# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(MIR_SOURCES
  mir.ssc
  models/mir.cmod
  textures/medres/chrome.png
  textures/medres/dock.png
  textures/medres/docking_ring.png
  textures/medres/dockkr.png
  textures/medres/metallwhite.png
  textures/medres/mir.png
  textures/medres/multi.png
  textures/medres/ODS_collar.png
  textures/medres/paneliss3.png
)

install_to_extras_subdir("${DATADIR}" mir ${MIR_SOURCES})
