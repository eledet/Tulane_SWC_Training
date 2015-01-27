#!/bin/bash

#########################################################################
# This file creates a combined tsv file from the individual country files
#########################################################################

OUTPUT_FILE="output/combined_gapMinder.tsv" #names the output file; tsv= 'tab separated value' file

echo Building combined country data file
cat data/clean/country.cc.txt > $OUTPUT_FILE #add column headers to the top of the output file

mv -v data/clean/country.cc.txt data/clean/country.cc.processed #temporarily moving the file to another location
sleep 2

cat data/clean/*.cc.txt #shows the data to be added
sleep 2
cat data/clean/*.cc.txt >> $OUTPUT_FILE #recursively adds each raw data to the bottom of a single output file

mv -v data/clean/country.cc.processed data/clean/country.cc.txt #move the new file to the original location

