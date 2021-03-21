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
function CreateListFile()
{

    for item in Infinitiv Präteritum "Partizip Perfekt"
       do

        echo file "'$item.mp3'" >> $1

       done

}

function CreateVerbFile()
{

    cd $1
    listFile=list.txt
    CreateListFile $listFile
    ffmpeg -f concat -safe 0 -i list.txt -vn ../../output/$(basename $1).m4a
    rm $listFile

}

mkdir output

for verb in input/*
   do

    (CreateVerbFile $verb)

   done
