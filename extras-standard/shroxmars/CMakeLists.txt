set(MARS_SOURCES
  models/marsglobalsurvr.3ds
  models/marsodyssey.3ds
  shroxmars.ssc
)

install_to_extras_subdir("${DATADIR}" shroxmars ${MARS_SOURCES})
