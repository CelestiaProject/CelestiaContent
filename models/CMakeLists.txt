# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

file(GLOB MODELS_SOURCES "*.3ds" "*.cmod" "*.cms" "*.png" "*.license")
install(FILES ${MODELS_SOURCES} DESTINATION "${DATADIR}/models" COMPONENT core)
