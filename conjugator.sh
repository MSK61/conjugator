#!/usr/bin/env bash
############################################################
#
# program:      verb conjugator
#
# file:         conjugator.sh
#
# function:     verb conjugator
#
# description:  creates sound recordings of verb conjugations
#
# author:       Mohammed El-Afifi (ME)
#
# environment:  Notepad++ v7.5.6, Windows 10 Home 20H2
#
# notes:        This is a private program.
#
############################################################
inputDir=input
outputDir=output

function CreateListFile()
{

    for item in Infinitiv Präteritum "Partizip Perfekt"
       do

        echo file "'$item.mp3'" >> $1

       done

}

function CreateVerbFile()
{

    echo Generating recording for verb $1
    cd $inputDir/$1
    listFile=list.txt
    CreateListFile $listFile
    ffmpeg -f concat -safe 0 -i list.txt -vn ../../$outputDir/$1.m4a \
        2> /dev/null
    rm $listFile

}

function ProcessVerb()
{

    if [ -f $outputDir/$1.m4a ]
       then

        echo Verb $1 already exists, skipping...

       else

        (CreateVerbFile $1)

       fi

}

mkdir -p $outputDir

for verb in $inputDir/*
   do

    ProcessVerb $(basename $verb)

   done
