# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

if(ENABLE_HIPPARCOS)
  add_custom_command(OUTPUT stars.dat COMMAND buildstardb -q DEPENDS buildstardb)
  add_custom_target(hipparcos_data ALL DEPENDS stars.dat)
endif()

set(DATA_SOURCES
  asterisms.dat
  asteroids.ssc
  asteroids_locs.ssc
  boundaries.dat
  charm2.stc
  comets.ssc
  dwarfplanets.ssc
  dwarfplanets_locs.ssc
  earth_locs.ssc
  extrasolar.ssc
  extrasolar.stc
  galaxies.dsc
  globulars.dsc
  hdxindex.dat
  hdxindex.dat.license
  interstellar.ssc
  jupitermoons_locs.ssc
  marsmoons_locs.ssc
  mars_locs.ssc
  merc_locs.ssc
  minormoons.ssc
  moon_locs.ssc
  nearstars.stc
  neptunemoons_locs.ssc
  openclusters.dsc
  outersys.ssc
  pulsars.stc
  revised.stc
  ring_locs.ssc
  saoxindex.dat
  saoxindex.dat.license
  saturnmoons_locs.ssc
  solarsys.ssc
  spectbins.stc
  starnames.dat
  starnames.dat.license
  stars.dat
  stars.dat.license
  uranusmoons_locs.ssc
  venus_locs.ssc
  visualbins.stc
  whitedwarfs.stc
  world-capitals.ssc
)

install(FILES ${DATA_SOURCES} DESTINATION "${DATADIR}/data" COMPONENT core)
