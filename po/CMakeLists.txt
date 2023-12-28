# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

if((NOT ENABLE_NLS) OR (NOT GETTEXT_FOUND))
  return()
endif()

file(GLOB PO_FILES "*.po")
gettext_create_translations2("celestia-data.pot" ALL ${PO_FILES})
