# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

file(GLOB MODELS_EXTRA_SOURCES "*.3ds" "*.cmod" "*.cms" "*.png" "*.license")
install(FILES ${MODELS_EXTRA_SOURCES} DESTINATION "${DATADIR}/models" COMPONENT models-extras EXCLUDE_FROM_ALL)
