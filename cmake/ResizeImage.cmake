# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

cmake_minimum_required(VERSION 3.10)

# Requires the following input variables to be defined
#
# INPUT_PATH                      - path to source image
# OUTPUT_PATH                     - path to output image
# MAXDIM                          - maximum output image dimension
#
# For ImageMagick v7
#
# ImageMagick_magick_EXECUTABLE   - path to magick command
#
# For ImageMagick v6
#
# ImageMagick_convert_EXECUTABLE  - path to convert command
# ImageMagick_identify_EXECUTABLE - path to identify command

if (ImageMagick_magick_EXECUTABLE)
  set(CONVERT_EXECUTABLE "${ImageMagick_magick_EXECUTABLE}")
  execute_process(
    COMMAND
      "${ImageMagick_magick_EXECUTABLE}" identify
        -format "%A"
        "${INPUT_PATH}"
    OUTPUT_VARIABLE ALPHA_TYPE
  )
else()
  set(CONVERT_EXECUTABLE "${ImageMagick_convert_EXECUTABLE}")
  execute_process(
    COMMAND
      "${ImageMagick_identify_EXECUTABLE}"
        -format "%A"
        "${INPUT_PATH}"
    OUTPUT_VARIABLE ALPHA_TYPE
  )
endif()

string(TOLOWER "${ALPHA_TYPE}" ALPHA_TYPE_LOWER)
set(NO_ALPHA_TYPES "false" "undefined")

if (ALPHA_TYPE_LOWER IN_LIST NO_ALPHA_TYPES)
  execute_process(
    COMMAND
      "${CONVERT_EXECUTABLE}"
        "${INPUT_PATH}"
        -resize "${MAXDIM}x${MAXDIM}"
        -define png:exclude-chunks=date,time
        "${OUTPUT_PATH}"
  )
else()
  execute_process(
    COMMAND
      "${CONVERT_EXECUTABLE}"
        "${INPUT_PATH}"
        "(" +clone -alpha extract ")"
        -alpha off
        -resize "${MAXDIM}x${MAXDIM}"
        -compose CopyOpacity -composite
        -define png:exclude-chunks=date,time
        "${OUTPUT_PATH}"
  )
endif()
