# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

set(APOLLO_SOURCES
  apollo.ssc
  models/apollo.3ds
)

install_to_extras_subdir("${DATADIR}" apollo ${APOLLO_SOURCES})
