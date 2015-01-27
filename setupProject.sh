#!/bin/bash

##########################################################
# This script will download the split gap minder zip file,
# unzip it, makes some directories, and backs up the data in to an archive folder
##########################################################


echo Creating project directory structure
sleep 2 #pauses
mkdir -v data code output data/archive 
# -v= verbose this code makes a data directory, a code directory, an output director, and a data archive

cd data
#changes directory to the data directory

# Fetch the zip file from the interwebs
ZIP_FILE_URL="http://npk.io/1jHRK+" #the URL of the data file
ZIP_FILE_NAME="rawSplitCountries.zip" #naming the data file

echo Downloading zipped data file from $ZIP_FILE_URL #display the URL to insure the script is running
sleep 2
curl -L $ZIP_FILE_URL -o $ZIP_FILE_NAME #downloading the data and naming it via -o (output command)

echo Unzipping file. 
sleep 2
unzip $ZIP_FILE_NAME

echo Copying the zip file contents to the archive directory
sleep 2
cp -vr clean archive/ #copying the -vr (verbose recursively) into the archive; this creates a clean raw data backup

# Move back up a dir
cd ../

