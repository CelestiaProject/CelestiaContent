set(GALILEO_SOURCES
  galileo.ssc
  data/galileo-cruise.xyzv
  data/galileo-orbit.xyzv
  data/galileo-probe.xyzv
  models/galileo.cmod
  models/galileo-probe.3ds
  textures/medres/foil_gold_ramp.png
  textures/medres/foil_n.png
  textures/medres/Galileo_Probe.jpg
  textures/medres/galileo_tex_01.jpg
  textures/medres/galileo_tex_02.jpg
)

install_to_extras_subdir("${DATADIR}" galileo ${GALILEO_SOURCES})
