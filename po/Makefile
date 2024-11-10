# SPDX-FileCopyrightText: Celestia Development Team
# SPDX-License-Identifier: GPL-2.0-or-later

po_files := $(wildcard *.po)
domain   := celestia-data
pot_file := $(domain).pot

all: po-update

$(pot_file): $(pot_file)-update

$(pot_file)-update: data.cpp
	xgettext --keyword=_ --keyword=i18n \
	         --keyword=C_:1c,2 --keyword=i18nc:1c,2 \
	         --sort-by-file --qt --add-comments \
	         --default-domain=$(domain) --package-name=celestia --package-version=1.7.0 \
	         --msgid-bugs-address=team@celestiaproject.space \
	         --copyright-holder="Celestia Development Team" \
	         --output=$(pot_file) \
	         --from-code=utf-8 \
	         data.cpp

data.cpp: ../data/asterisms.dat ../data/solarsys.ssc ../data/earth_locs.ssc ../data/world-capitals.ssc ../data/dwarfplanets.ssc ../data/minormoons.ssc ../data/well-known-starnames.txt ../data/well-known-dsonames.txt
	egrep '^\"' ../data/asterisms.dat | awk -F'\"' '{ print "C_(\"asterism\", \"" $$2 "\");" }' > data.cpp
	egrep '^(\"|ReferencePoint)' ../data/solarsys.ssc | awk -F'\"|:' '{ print "_(\"" $$2 "\");" }' >> data.cpp
	egrep '^(\"|ReferencePoint)' ../data/dwarfplanets.ssc | awk -F'\"|:' '{ print "_(\"" $$2 "\");" }' >> data.cpp
	egrep '^(\"|ReferencePoint)' ../data/minormoons.ssc | awk -F'\"|:' '{ print "_(\"" $$2 "\");" }' >> data.cpp
	grep \"Sol/Earth\" ../data/earth_locs.ssc | awk -F\" '{ print "_(\"" $$2 "\");" }' >> data.cpp
	grep \"Sol/Earth\" ../data/world-capitals.ssc | awk -F\" '{ print "_(\"" $$2 "\");" }' >> data.cpp
	cat ../data/well-known-starnames.txt | awk '{ print "_(\"" $$0 "\");" }' >> data.cpp
	cat ../data/well-known-dsonames.txt | awk '{ print "_(\"" $$0 "\");" }' >> data.cpp

po-update: $(po_files)

%.po: $(pot_file)
	msgmerge --update $@ $(pot_file)

clean: clean-data

clean-data:
	rm -rf data.cpp
