if(ENABLE_HIPPARCOS)
  add_custom_command(OUTPUT stars.dat COMMAND buildstardb -q DEPENDS buildstardb)
  add_custom_target(hipparcos_data ALL DEPENDS stars.dat)
endif()

set(DATA_SOURCES
  asterisms.dat
  boundaries.dat
  hdxindex.dat
  saoxindex.dat
  starnames.dat
  stars.dat
  extrasolar.ssc
  solarsys.ssc
  charm2.stc
  extrasolar.stc
  nearstars.stc
  revised.stc
  spectbins.stc
  visualbins.stc
  asteroids_locs.ssc
  asteroids.ssc
  comets.ssc
  dwarfplanets_locs.ssc
  dwarfplanets.ssc
  earth_locs.ssc
  galaxies.dsc
  globulars.dsc
  jupitermoons_locs.ssc
  mars_locs.ssc
  marsmoons_locs.ssc
  merc_locs.ssc
  minormoons.ssc
  moon_locs.ssc
  neptunemoons_locs.ssc
  openclusters.dsc
  outersys.ssc
  pulsars.stc
  ring_locs.ssc
  saturnmoons_locs.ssc
  uranusmoons_locs.ssc
  venus_locs.ssc
  world-capitals.ssc
)

install(FILES ${DATA_SOURCES} DESTINATION "${DATADIR}/data" COMPONENT core)
