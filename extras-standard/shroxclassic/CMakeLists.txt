# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(CLASSIC_SOURCES
  models/gemini.3ds
  models/mercury7.3ds
  shroxclassic.ssc
)

install_to_extras_subdir("${DATADIR}" shroxclassic ${CLASSIC_SOURCES})
