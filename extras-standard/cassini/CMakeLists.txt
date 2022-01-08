set(CASSINI_SOURCES
  data/cassini-cruise.xyzv
  data/cassini-saturn_01y.xyzv
  data/cassini-saturn_02y.xyzv
  data/cassini-saturn_03y.xyzv
  data/cassini-saturn_04y.xyzv
  data/cassini-saturn_05y.xyzv
  data/cassini-saturn_06y.xyzv
  data/cassini-saturn_07y.xyzv
  data/cassini-saturn_08y.xyzv
  data/cassini-saturn_09y.xyzv
  data/cassini-saturn_10y.xyzv
  data/cassini-saturn_11y.xyzv
  data/cassini-saturn_12y.xyzv
  data/cassini-saturn_13y.xyzv
  data/cassini-saturn_14y.xyzv
  data/huygens.xyzv
  cassini.ssc
  models/cassini.3ds
  models/huygens.3ds
)

install_to_extras_subdir("${DATADIR}" cassini ${CASSINI_SOURCES})
