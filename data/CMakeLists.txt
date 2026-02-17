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
  comets.ssc
  dwarfplanets.ssc
  dwarfplanets_locs.ssc
  earth_locs.ssc
  extrasolar.ssc
  extrasolar.stc
  galaxies.dsc
  globulars.dsc
  interstellar.ssc
  jupitermoons_locs.ssc
  marsmoons_locs.ssc
  mars_locs.ssc
  merc_locs.ssc
  minormoons.ssc
  moon_locs.ssc
  neptunemoons_locs.ssc
  openclusters.dsc
  outersys.ssc
  pulsars.stc
  ring_locs.ssc
  saturnmoons_locs.ssc
  solarsys.ssc
  starnames.dat
  starnames.dat.license
  stars-charm2.stc
  stars-near.stc
  stars-revised.stc
  stars-spectbins.stc
  stars-visualbins.stc
  stars.dat
  stars.dat.license
  starxindex-hd.dat
  starxindex-hd.dat.license
  starxindex-sao.dat
  starxindex-sao.dat.license
  uranusmoons_locs.ssc
  venus_locs.ssc
  whitedwarfs.stc
  world-capitals.ssc
)

install(FILES ${DATA_SOURCES} DESTINATION "${DATADIR}/data" COMPONENT core)
