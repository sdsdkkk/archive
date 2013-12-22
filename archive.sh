#!/bin/bash

BASE=$(basename "$0")

for i in *
do
  if [ "$i" != "$BASE" ]
  then
    TYPE=$(file $i)
    DIR="$i: directory"
    if [ "$TYPE" != "$DIR" ]
    then
      filename=$(basename "$i")
      extension="${filename##*.}"
      filename="${filename%.*}"
      if [ ! -d "$extension" ]
      then
        mkdir $extension
      fi
      mv $i ./$extension/$i
    fi
  fi
done