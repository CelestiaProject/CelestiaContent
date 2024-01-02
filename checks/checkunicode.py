#!/usr/bin/env python3

# SPDX-FileCopyrightText: 2024 Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

"""Checks for Unicode normalization forms in CelestiaContent"""

import codecs
from enum import auto, Enum
import os
import sys
from typing import TextIO
import unicodedata


def eprint(*args, **kwargs) -> None:
    """Print to stderr"""
    print(*args, file=sys.stderr, **kwargs)


class _CheckState(Enum):
    NORMAL = auto()
    QUOTED = auto()
    ESCAPE = auto()


def check_starnames(file: TextIO) -> bool:
    """Check starnames.dat for non-NFC strings"""
    result = True
    for line_number, line in enumerate(file, 1):
        linesplit = line[:-1].split(":")
        for entry in linesplit[1:]:
            if not unicodedata.is_normalized("NFC", entry):
                result = False
                eprint(f"Non-normalized NFC in {file.name} ({line_number})")
    return result


def _check_string(
    unescaped: str, file_name: str, line_number: int, split_names: bool
) -> bool:
    result = True
    expanded = codecs.unicode_escape_decode(unescaped)[0]
    if split_names:
        for alt_name in expanded.split(":"):
            if not unicodedata.is_normalized("NFC", alt_name):
                result = False
                eprint(
                    f'Non-normalized string constant "{unescaped}" in {file_name} ({line_number})'
                )
    elif not unicodedata.is_normalized("NFC", expanded):
        eprint(
            f'Non-normalized string constant "{unescaped}" in {file_name} ({line_number})'
        )
    return result


def check_strings(file: TextIO, catalog_checks: bool) -> bool:
    """Check strings in .ssc/.stc file"""
    result = True
    bracket_level = 0
    start_quote = 0
    for line_number, line in enumerate(file, 1):
        state = _CheckState.NORMAL
        for pos, ch in enumerate(line):
            if state == _CheckState.NORMAL:
                if ch == '"':
                    start_quote = pos + 1
                    state = _CheckState.QUOTED
                elif ch == "#":
                    break
                elif ch == "[":
                    bracket_level += 1
                elif ch == "]":
                    bracket_level -= 1
            elif state == _CheckState.QUOTED:
                if ch == "\\":
                    state = _CheckState.ESCAPE
                elif ch == '"':
                    split_names = catalog_checks and bracket_level == 0
                    result &= _check_string(
                        line[start_quote:pos], file.name, line_number, split_names
                    )
                    state = _CheckState.NORMAL
            elif state == _CheckState.ESCAPE:
                state = _CheckState.QUOTED
    return result


def check_directory(dirname: str, extensions: list[str], catalog_checks: bool) -> bool:
    """Checks all files in a directory"""
    result = True
    casefolded_extensions = [e.casefold() for e in extensions]
    for root, _dirs, files in os.walk(dirname, topdown=True):
        for file in files:
            extension = os.path.splitext(file)[1]
            if extension.casefold() in casefolded_extensions:
                with open(os.path.join(root, file), "rt", encoding="utf-8") as f:
                    result &= check_strings(f, catalog_checks)
    return result


def check_files() -> bool:
    """Checks the Unicode normalization status of CelestiaContent"""
    result = True
    with open("data/starnames.dat", "rt", encoding="utf-8") as f:
        result &= check_starnames(f)

    with open("data/asterisms.dat", "rt", encoding="utf-8") as f:
        result &= check_strings(f, catalog_checks=False)

    data_file_directories = ["data", "extras", "extras-standard"]
    data_file_extensions = [".ssc", ".stc", ".dsc"]
    for dirname in data_file_directories:
        result &= check_directory(dirname, data_file_extensions, catalog_checks=True)

    result &= check_directory("po", [".po", ".pot"], catalog_checks=False)

    return result


if __name__ == "__main__":
    os.chdir(os.path.join(os.path.dirname(__file__), ".."))
    if not check_files():
        print("Unicode errors detected")
        sys.exit(1)
    else:
        print("Unicode ok")
        sys.exit(0)
